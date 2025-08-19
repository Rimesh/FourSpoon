//
//  NetworkError.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(statusCode: Int)
    case decondingFailure
}
