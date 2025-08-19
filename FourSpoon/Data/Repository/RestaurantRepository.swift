//
//  RestaurantRepository.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

class RestaurantRepository: RestaurantRepositoryProtocol {
    private let apiClient: APIClientProtocol
    private let apiConfiguration: RestaurantAPIConfiguration

    init(apiClient: APIClientProtocol, apiConfiguration: RestaurantAPIConfiguration) {
        self.apiClient = apiClient
        self.apiConfiguration = apiConfiguration
    }

    func getRestaurants(regionId: UUID?, page: Int?) async throws -> RestaurantListResponse {
        guard let restaurantListUrl = apiConfiguration.makeRestaurantListURL(regionId: regionId, page: page) else {
            throw NSError(domain: "Invalid Restaurant URL", code: 1)
        }

        return try await apiClient.request(url: restaurantListUrl, method: .get)
    }
}
