//
//  GetRestaurantListUseCaseProtocol.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

protocol GetRestaurantListUseCaseProtocol {
    func execute(regionId: UUID?, page: Int?) async throws -> PaginatedResponse<RestaurantListItem>
}
