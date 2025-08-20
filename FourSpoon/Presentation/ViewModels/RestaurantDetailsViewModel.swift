//
//  RestaurantDetailsViewModel.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Combine
import SwiftUI

@MainActor
class RestaurantDetailsViewModel: ObservableObject {
    @Published private(set) var restaurantDetails: RestaurantDetails?
    @Published private(set) var isLoading = false
    @Published var showError = false

    private let getRestaurantDetailsUseCase: GetRestaurantDetailsUseCaseProtocol

    private let restaurantId: UUID = .init(uuidString: "436e3abb-a0ff-4f33-a16b-f63b4fc6e031")!

    init(
        getRestaurantDetailsUseCase: GetRestaurantDetailsUseCaseProtocol
    ) {
        self.getRestaurantDetailsUseCase = getRestaurantDetailsUseCase
    }

    func loadRestaurantDetails() async {
        isLoading = true
        do {
            let response = try await getRestaurantDetailsUseCase.execute(restaurantId: restaurantId)
            restaurantDetails = response
            isLoading = false
        } catch {
            showError = true
            isLoading = false
        }
    }
}
