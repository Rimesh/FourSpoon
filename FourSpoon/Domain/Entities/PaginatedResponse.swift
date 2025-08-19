//
//  PaginatedResponse.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct PaginatedResponse<T> {
    let data: [T]
    let meta: PaginationMeta
}

struct PaginationMeta {
    let currentPage: Int
    let totalPages: Int
    let hasNextPage: Bool
}
