import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingFailed
    case serverError(statusCode: Int, message: String)
    case networkError(Error)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .noData:
            return "No data was returned from the server."
        case .decodingFailed:
            return "Failed to decode the server response."
        case .serverError(_, let message):
            return message
        case .networkError(let error):
            return error.localizedDescription
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

