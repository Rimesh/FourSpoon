//
//  RestaurantListResponse.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct RestaurantListResponse: Decodable {
    let data: [RestaurantListItemDTO]
    let meta: PaginationMetaDTO
}
