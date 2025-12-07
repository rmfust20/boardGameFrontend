//
//  APIClient.swift
//  BoardGameReview
//
//  Created by Robert Fusting on 12/6/25.
//

import Foundation

final class APIClient {
    
    static let shared = APIClient()
    private let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        config.waitsForConnectivity = true
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        self.session = URLSession(configuration: config)
        }
    
    func getSession() -> URLSession {
        return session
    }
}


