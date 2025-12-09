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
    
    init(boardGameService: BoardGameService = BoardGameService()) {
        self.boardGameService = boardGameService
    }
    
    @MainActor
    func fetchBoardGames(_ userID : Int) async -> [BoardGameModel] {
        let url = "http://127.0.0.1:8000/boardGames/user/\(userID)"
        let fetchedBoardGames = try? await boardGameService.fetchBoardGameFeedForUser(String(userID), url,  LastSeenID)
        if let fetchedBoardGames = fetchedBoardGames {
            print(fetchedBoardGames[0].name)
            self.boardGames.append(contentsOf: fetchedBoardGames)
            LastSeenID = boardGames.last?.id
            return boardGames
        }
        else {
            return []
        }
    }
    
}
