//
//  ReviewService.swift
//  boardGameReview
//
//  Created by Robert Fusting on 1/5/26.
//

import Foundation

struct ReviewService {
    let client: APIClient
    let baseURL: String

    init(client: APIClient = APIClient.shared) {
        self.client = client
        self.baseURL = "http://127.0.0.1:8000"
    }
    
    func postReview(review: ReviewModel) async throws {
        var components = URLComponents(string: baseURL)
        components?.path = "/reviews/postReview"
        guard let url = components?.url else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        
        print(url.absoluteString)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(review)
        request.httpBody = data
        
        let (responseData, response) = try await client.getSession().data(for: request)
        
        guard let http = response as? HTTPURLResponse else { throw APIError.invalidResponse }
        guard (200...299).contains(http.statusCode) else { throw APIError.httpStatus(http.statusCode) }
        
        print(responseData)
        
    }
    
    func getReviews(boardGameID: Int) async throws -> [ReviewModel] {
        var components = URLComponents(string: baseURL)
        components?.path = "/reviews/boardGame/\(boardGameID)"
        guard let url = components?.url else { throw APIError.invalidURL }
        
        let (data, response) = try await client.getSession().data(from: url)
        
        

        guard let http = response as? HTTPURLResponse else { throw APIError.invalidResponse }
        guard (200...299).contains(http.statusCode) else { throw APIError.httpStatus(http.statusCode) }
        
        let reviews = try JSONDecoder().decode([ReviewModel].self, from: data)
        
        return reviews

    }
}
