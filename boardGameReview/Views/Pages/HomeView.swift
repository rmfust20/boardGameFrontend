//
//  HomeView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/7/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var boardGameViewModel = BoardGameViewModel()
    @State var boardGames: [BoardGameModel] = []
    let userID = 1
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(boardGames) { boardGame in
                    BoardGameCardView(boardGame: boardGame)
                    
                        .onAppear() {
                            if boardGame.id == boardGames.last?.id {
                                Task { boardGames = await boardGameViewModel.fetchBoardGames(userID)
                                }
                            }
                        }
                }
            }
        }
        .onAppear() {
            Task {
                boardGames = await boardGameViewModel.fetchBoardGames(1)
                print(boardGames.count)
            }
        }
    }
}

#Preview {
    HomeView()
}
