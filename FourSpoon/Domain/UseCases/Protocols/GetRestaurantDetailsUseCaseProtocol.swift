//
//  GetRestaurantDetailsUseCaseProtocol.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

protocol GetRestaurantDetailsUseCaseProtocol {
    func execute(restaurantId: UUID) async throws -> RestaurantDetails
}
