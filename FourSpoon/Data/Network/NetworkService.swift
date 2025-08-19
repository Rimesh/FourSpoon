//
//  NetworkService.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRestaurants(regionId: UUID?, page: Int?) async throws -> RestaurantListResponse
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

        do {
            print("Requested url: \(url)")
            let (data, _) = try await session.data(from: url)

            do {
                let decodedResponse = try JSONDecoder().decode(RestaurantListResponse.self, from: data)
                return decodedResponse
            } catch {
                throw NetworkError.decondingFailure
            }
        } catch {
            throw NetworkError.noInternet
        }
    }
}
