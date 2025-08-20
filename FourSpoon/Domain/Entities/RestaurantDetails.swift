//
//  RestaurantDetails.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

struct RestaurantDetails: Identifiable {
    let id: UUID
    let name: String
    let priceLevel: PriceLevel?
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
    let alcohol: Bool
    let smoking: Bool
    let valet: Bool
    let description: String
    let externalRatingsURL: URL?
    let imageURLs: [URL]
}
