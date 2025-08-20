//
//  RestaurantListItemDTO.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct RestaurantListItemDTO: Decodable {
    let id: UUID
    let attributes: RestaurantAttributesDTO
}
