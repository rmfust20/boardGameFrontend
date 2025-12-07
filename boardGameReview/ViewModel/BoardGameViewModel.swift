//
//  BoardGameViewModel.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/7/25.
//

import Foundation

class BoardGameViewModel: ObservableObject {
    private let boardGameService: BoardGameService
    @Published var boardGames: [BoardGameModel] = []
    @Published var boardGame : BoardGameModel? = nil
    @Published var LastSeenID: Int? = nil
    
    init(boardGameService: BoardGameService = BoardGameService(baseURL: "http://127.0.0.1:8000/boardGames")) {
        self.boardGameService = boardGameService
    }
    
    @MainActor
    func fetchBoardGames(_ userID : Int) async -> String {
        let fetchedBoardGames = try? await boardGameService.fetchBoardGameFeedForUser(String(userID), LastSeenID)
        if let fetchedBoardGames = fetchedBoardGames {
            self.boardGames.append(contentsOf: fetchedBoardGames)
            LastSeenID = boardGames.last?.id
            return "Success"
        }
        else {
            return "Failed to fetch board games."
        }
    }
    
}
