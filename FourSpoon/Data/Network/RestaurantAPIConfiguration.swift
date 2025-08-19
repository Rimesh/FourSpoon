//
//  RestaurantAPIConfiguration.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

struct RestaurantAPIConfiguration: APIConfigurationProtocol {
    var baseURL: String {
        return "https://api.eat-sandbox.co/consumer/v2/restaurants"
    }

    func makeRestaurantListURL(regionId: UUID?, page: Int?) -> URL? {
        let restaurantURL = baseURL
        var queryItems: [URLQueryItem] = []

        if let regionId {
            queryItems.append(URLQueryItem(name: "region_id", value: regionId.uuidString))
        }
        if let page {
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }

        var components = URLComponents(string: restaurantURL)
        components?.queryItems = queryItems.isEmpty ? nil : queryItems
        return components?.url
    }
}
