//
//  APIClientProtocol.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

public protocol APIClientProtocol {
    func request<T: Decodable>(url: URL, method: HTTPMethod) async throws -> T
}
