import Foundation

struct BoardGameService {
    let baseURL: String
    let client: APIClient

    init(baseURL: String, client: APIClient = APIClient.shared) {
        self.baseURL = baseURL
        self.client = client
    }

    func fetchBoardGameFeedForUser(_ userID: String, _ lastSeenID: Int?) async throws -> [BoardGameModel] {
        var urlComponents = URLComponents(string: baseURL)!
        urlComponents.queryItems = [URLQueryItem(name: "userID", value: userID)]
        if let lastSeenID = lastSeenID {
            urlComponents.queryItems?.append(URLQueryItem(name: "lastSeenID", value: "\(lastSeenID)"))
        }

        guard let url = urlComponents.url else { throw APIError.invalidURL }

        let (data, response) = try await client.getSession().data(from: url)
        guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            throw APIError.serverError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0,
                                       message: "Server error")
        }

        return try JSONDecoder().decode([BoardGameModel].self, from: data)
    }
}

