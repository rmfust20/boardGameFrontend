//
//  BookView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/12/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookView: View {
    let boardGame: BoardGameModel
    var body: some View {
        ScrollView {
            ZStack {
                Color("BoardGameViewBackDrop")
                WebImage(url: URL(string: boardGame.thumbnail ?? "Nothing"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 300)
                            .clipped()
                            .padding(.top,50)
            }
            .frame(height: 430)
            Text(boardGame.name)
                .font(.title)
            Text("by Robert Fusting, Emit Strong")
            HStack {
                ComputedRatingView()
            }
            
                
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BookView(boardGame: BoardGameModel(
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
