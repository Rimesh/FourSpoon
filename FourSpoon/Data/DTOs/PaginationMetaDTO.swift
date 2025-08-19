//
//  PaginationMetaDTO.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct PaginationMetaDTO: Decodable {
    let totalPages: Int
    let totalCount: Int
    let currentPage: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalCount = "total_count"
        case currentPage = "current_page"
    }
}
