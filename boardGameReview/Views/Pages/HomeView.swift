//
//  HomeView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/7/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: HomeRouter
    @ObservedObject var boardGameViewModel = BoardGameViewModel()
    @ObservedObject var reviewViewModel = ReviewViewModel()
    @State var boardGames: [BoardGameModel] = []
    @State private var showStars: Bool = false
    let userID = 1
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(boardGames) { boardGame in
                        BoardGameCardView(boardGame: boardGame, showStars: $showStars)
                        
                            .onAppear() {
                                if boardGame.id == boardGames.last?.id {
                                    Task { boardGames = await boardGameViewModel.fetchBoardGamesFromNetwork(userID)
                                    }
                                }
                            }
                    }
                }
            }
            .onAppear() {
                Task {
                    boardGames = await boardGameViewModel.fetchBoardGames(1)
                }
            }
            AddStars(isPresented: $showStars)
        }
    }
}

struct AddStars: View {
    let bookTitle: String = "Sample Book"
    @Binding var isPresented: Bool
    var body: some View {
        if isPresented {
            VStack {
                Spacer()
                List {
                    HStack{
                        Spacer()
                        Text(bookTitle)
                            .font(.system(size:12))
                            .foregroundStyle(Color.gray)
                        Spacer()
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { dimensions in
                        dimensions[.leading]
                    }
                    ForEach(1...5, id: \.self) { index in
                        HStack {
                            Spacer()
                            ForEach(1...index, id:\.self) { star_count in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.gray)
                                    .padding(.trailing,-10)
                            }
                            Text("\(index) Stars" )
                                .padding(.leading,5)
                            Spacer()
                        }
                        .alignmentGuide(.listRowSeparatorLeading) { dimensions in
                            dimensions[.leading]
                        }
                    }
                    HStack{
                        Spacer()
                        Button {
                            withAnimation(.spring(response:0.50)) {
                                isPresented = false
                            }
                        } label : {
                            Text("Cancel")
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                
            }
            .transition(.move(edge: .bottom))
        }
    }
}


#Preview {
  HomeView().environmentObject(HomeRouter())
}
