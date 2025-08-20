//
//  RestaurantListViewModel.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Combine
import SwiftUI

@MainActor
class RestaurantListViewModel: ObservableObject {
    @Published private(set) var restaurants: [RestaurantListItem] = []
    @Published private(set) var isInitialLoading = false
    @Published private(set) var isLoadingMoreData = false
    @Published private(set) var hasMorePages = true

    @Published var searchQuery = ""

    @Published private var currentPage = 1

    @Published var showError = false

    private let getRestaurantsUseCase: GetRestaurantListUseCaseProtocol

    private let givenRegionId: UUID = .init(uuidString: "3906535a-d96c-47cf-99b0-009fc9e038e0")!

    private var subscriptions: Set<AnyCancellable> = []

    init(
        getRestaurantsUseCase: GetRestaurantListUseCaseProtocol
    ) {
        self.getRestaurantsUseCase = getRestaurantsUseCase
        $searchQuery
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { _ in
                self.reloadRestaurantList()
            }
            .store(in: &subscriptions)
    }

    func loadRestaurants() async {
        guard restaurants.isEmpty else { return }
        isInitialLoading = true
        do {
            let response = try await getRestaurantsUseCase.execute(
                regionId: givenRegionId,
                page: currentPage,
                query: searchQuery
            )
            restaurants = response.data
            hasMorePages = response.meta.hasNextPage
            currentPage += 1
            isInitialLoading = false
        } catch {
            showError = true
            isInitialLoading = false
        }
    }

    func loadMoreRestaurants() async {
        guard hasMorePages
            && isLoadingMoreData == false
            && isInitialLoading == false
        else { return }
        isLoadingMoreData = true
        do {
            let response = try await getRestaurantsUseCase.execute(
                regionId: givenRegionId,
                page: currentPage,
                query: searchQuery
            )
            restaurants.append(contentsOf: response.data)

            hasMorePages = response.meta.hasNextPage
            currentPage += 1
            isLoadingMoreData = false
        } catch {
            // fail silently, no need to notify user when Infinite scrolling
            isLoadingMoreData = false
        }
    }

    func reloadRestaurantList() {
        currentPage = 1
        restaurants.removeAll()
        isInitialLoading = false
        isLoadingMoreData = false
        showError = false
        hasMorePages = true
        Task { await loadRestaurants() }
    }
}
