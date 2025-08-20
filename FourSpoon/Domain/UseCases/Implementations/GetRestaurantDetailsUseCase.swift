//
//  GetRestaurantDetailsUseCase.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

final class GetRestaurantDetailsUseCase: GetRestaurantDetailsUseCaseProtocol {
    private let repository: RestaurantRepositoryProtocol

    init(repository: RestaurantRepositoryProtocol) {
        self.repository = repository
    }

    func execute(restaurantId: UUID) async throws -> RestaurantDetails {
        return try await repository.getRestaurantDetails(restaurantId: restaurantId)
    }
}
