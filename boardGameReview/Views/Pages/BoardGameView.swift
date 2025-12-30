//
//  BookView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/12/25.
//

import SwiftUI
import SDWebImageSwiftUI
struct BoardGameView: View {
    let boardGameID: Int
    @State var cardImage: UIImage? = nil
    @State var boardGame: BoardGameModel? = nil
    @ObservedObject var boardGameViewModel = BoardGameViewModel()
    var body: some View {
        ScrollView {
            ZStack {
                Color("BoardGameViewBackDrop")
                Image(uiImage: cardImage ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipped()
                        .padding(.top,50)
            }
            .onAppear() {
                Task {
                    boardGameViewModel.boardGameID = boardGameID
                    await boardGameViewModel.presentBoardGame()
                    await boardGameViewModel.presentImage()
                    boardGame = boardGameViewModel.boardGame
                    cardImage = boardGameViewModel.boardGameImage
                }
            }
            .frame(height: 430)
            Text(boardGame?.name ?? "Loading")
                .font(.title)
            Text("by Robert Fusting, Emit Strong")
            HStack {
                ComputedRatingView()
            }
            .padding(.top,10)
            Rectangle()
                .fill(Color.gray)
                .opacity(0.50)
                .frame(height: 2)
            WantToPlayButtonView()
                .padding(.bottom,10)
            RateThisGameFullView()
                //.padding(.bottom,10)
            Rectangle()
                .fill(Color.gray)
                .opacity(0.50)
                .frame(height: 2)
                .padding(.top,30)
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                    Text("More Info")
                }
                Spacer()
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.50)
                    .frame(width: 1)
                Spacer()
                VStack {
                    Image(systemName: "arrowshape.turn.up.forward.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                    Text("Share")
                }
                Spacer()
            }
            Rectangle()
                .fill(Color.gray)
                .opacity(0.50)
                .frame(height: 1)
                .padding(.top,10)
                
        }
        .onAppear {
            Task {
                boardGame = BoardGameCache.shared.get(id: boardGameID)
                
                if boardGame == nil {
                    boardGame = await BoardGameViewModel().fetchBoardGame( boardGameID)
                    
                    if let boardGame = boardGame {
                        BoardGameCache.shared.set(boardGame)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BoardGameView(boardGameID:1, boardGame: BoardGameModel(
        id: 1,
        name: "Die Macher",
        thumbnail: "https://cf.geekdo-images.com/rpwCZAjYLD940NWwP3SRoA__small/img/YT6svCVsWqLrDitcMEtyazVktbQ=/fit-in/200x150/filters:strip_icc()/pic4718279.jpg",
        play_time: 60,
        min_players: 3,
        max_players: 4,
        year_published: 1995,
        description: "Trade, build, and settle the island of Catan.",
        min_age: 10,
        image: "https://example.com/catan-image.jpg"
    ))
}
