//
//  APIClient.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

class APIClient: APIClientProtocol {
    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func request<T>(url: URL, method: HTTPMethod) async throws -> T where T: Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        print("Requested URl: \(url)")
        let (data, response) = try await session.data(for: request)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
