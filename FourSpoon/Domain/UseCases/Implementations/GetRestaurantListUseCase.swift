//
//  GetRestaurantListUseCase.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

final class GetRestaurantListUseCase: GetRestaurantListUseCaseProtocol {
    private let repository: RestaurantRepositoryProtocol

    init(repository: RestaurantRepositoryProtocol) {
        self.repository = repository
    }

    func execute(regionId: UUID?, page: Int?) async throws -> PaginatedResponse<RestaurantListItem> {
        return try await repository.getRestaurants(regionId: regionId, page: page)
    }
}
