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
    @Published private(set) var errorMessage: String?
    @Published private(set) var hasMorePages = true

    @Published private var currentPage = 1

    private let getRestaurantsUseCase: GetRestaurantListUseCaseProtocol

    private let givenRegionId: UUID = .init(uuidString: "3906535a-d96c-47cf-99b0-009fc9e038e0")!

    init(
        getRestaurantsUseCase: GetRestaurantListUseCaseProtocol
    ) {
        self.getRestaurantsUseCase = getRestaurantsUseCase
    }

    func loadRestaurants() async {
        isInitialLoading = true
        do {
            let response = try await getRestaurantsUseCase.execute(
                regionId: givenRegionId,
                page: currentPage
            )
            restaurants = response.data
            hasMorePages = response.meta.hasNextPage
            currentPage += 1
            isInitialLoading = false
        } catch {
            errorMessage = "Something went wrong, Please try again later..."
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
                page: currentPage
            )
            restaurants.append(contentsOf: response.data)

            hasMorePages = response.meta.hasNextPage
            currentPage += 1
            isLoadingMoreData = false
        } catch {
            errorMessage = "Something went wrong, Please try again later..."
            isLoadingMoreData = false
        }
    }
}
