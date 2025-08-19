//
//  RestaurantRepository.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

class RestaurantRepository: RestaurantRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getRestaurants(regionId: UUID?, page: Int?) async throws -> PaginatedResponse<RestaurantListItem> {
        let response = try await networkService.getRestaurants(regionId: regionId, page: page)
        return response.toDomain()
    }
}
