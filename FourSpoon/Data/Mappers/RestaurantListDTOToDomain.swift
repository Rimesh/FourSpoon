//
//  RestaurantListDTOToDomain.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

extension RestaurantListResponse {
    func toDomain() -> PaginatedResponse<RestaurantListItem> {
        PaginatedResponse(
            data: data.map { $0.toDomain()
            },
            meta: .init(
                currentPage: meta.currentPage,
                totalPages: meta.totalPages,
                hasNextPage: meta.currentPage < meta.totalPages
            )
        )
    }
}
