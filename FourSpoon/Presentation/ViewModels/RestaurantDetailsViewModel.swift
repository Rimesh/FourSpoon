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
    private let restaurantId: UUID

    init(
        getRestaurantDetailsUseCase: GetRestaurantDetailsUseCaseProtocol,
        restaurantId: UUID
    ) {
        self.getRestaurantDetailsUseCase = getRestaurantDetailsUseCase
        self.restaurantId = restaurantId
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
