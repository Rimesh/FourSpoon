//
//  RestaurantListItem.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct RestaurantListItem: Identifiable {
    let id: UUID
    let name: String
    let priceLevel: PriceLevel
    let phoneNumber: String?
    let menuURL: URL?
    let cuisine: String
    let imageURL: URL
    let latitude: Double
    let longitude: Double
    let streetAddress: String
    let ratingsAverage: String?
    let ratingsCount: Int?
    let labels: [String]

    enum PriceLevel: Int {
        case unknown = 0
        case cheap = 1
        case moderate = 2
        case expensive = 3
    }
}
