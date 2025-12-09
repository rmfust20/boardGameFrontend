import Foundation

struct BoardGameService {
    let client: APIClient

    init(client: APIClient = APIClient.shared) {
        self.client = client
    }

    func fetchBoardGameFeedForUser(_ userID: String, _ url: String, _ lastSeenID: Int?) async throws -> [BoardGameModel] {
        var urlComponents = URLComponents(string: url)!
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

