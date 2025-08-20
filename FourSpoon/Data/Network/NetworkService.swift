//
//  NetworkService.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRestaurants(regionId: UUID?, page: Int?) async throws -> RestaurantListResponse
    func getRestaurantDetails(restaurantId: UUID) async throws -> RestaurantDetailsResponse
}

class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let baseURL: String

    init(session: URLSession = .shared, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }

    func getRestaurants(regionId: UUID?, page: Int?) async throws -> RestaurantListResponse {
        guard var components = URLComponents(string: "\(baseURL)/restaurants") else {
            throw NetworkError.invalidURL
        }
        var queryItems: [URLQueryItem] = []

        if let regionId {
            queryItems.append(URLQueryItem(name: "region_id", value: regionId.uuidString))
        }

        if let page {
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }

        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else { throw NetworkError.invalidURL }

        let (data, urlResponse) = try await session.data(from: url)

        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
        }

        do {
            let decodedResponse = try JSONDecoder().decode(RestaurantListResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decondingFailure
        }
    }

    func getRestaurantDetails(restaurantId: UUID) async throws -> RestaurantDetailsResponse {
        guard let components = URLComponents(string: "\(baseURL)/restaurants/\(restaurantId.uuidString)") else {
            throw NetworkError.invalidURL
        }

        guard let url = components.url else { throw NetworkError.invalidURL }

        let (data, urlResponse) = try await session.data(from: url)

        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
        }

        do {
            let decodedResponse = try JSONDecoder().decode(RestaurantDetailsResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decondingFailure
        }
    }
}
