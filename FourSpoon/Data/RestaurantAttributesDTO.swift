//
//  RestaurantAttributesDTO.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct RestaurantAttributesDTO: Decodable {
    let name: String
    let priceLevel: Int
    let phone: String?
    let menuURL: URL?
    let cuisine: String
    let imageURL: URL
    let latitude: Double
    let longitude: Double
    let addressLine1: String
    let ratingsAverage: String?
    let ratingsCount: Int?
    let labels: [String]

    enum CodingKeys: String, CodingKey {
        case name, phone, cuisine, latitude, longitude, labels
        case priceLevel = "price_level"
        case menuURL = "menu_url"
        case imageURL = "image_url"
        case addressLine1 = "address_line_1"
        case ratingsAverage = "ratings_average"
        case ratingsCount = "ratings_count"
    }
}
