//
//  RestaurantRepositoryProtocol.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

protocol RestaurantRepositoryProtocol {
    func getRestaurants(regionId: UUID?, page: Int?) async throws -> PaginatedResponse<RestaurantListItem>
    func getRestaurantDetails(restaurantId: UUID) async throws -> RestaurantDetails
}
