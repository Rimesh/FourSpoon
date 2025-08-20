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

    func getRestaurants(regionId: UUID?, page: Int?, query: String?) async throws -> PaginatedResponse<RestaurantListItem> {
        let response = try await networkService.getRestaurants(regionId: regionId, page: page, query: query)
        return response.toDomain()
    }

    func getRestaurantDetails(restaurantId: UUID) async throws -> RestaurantDetails {
        let response = try await networkService.getRestaurantDetails(restaurantId: restaurantId)
        return response.data.toDomain()
    }
}
