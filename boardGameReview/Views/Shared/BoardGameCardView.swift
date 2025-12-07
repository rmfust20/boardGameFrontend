//
//  BoardGameCardView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/7/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct BoardGameCardView: View {
    let image : String = ""
    let title: String = "Sample Title Until Robert Adds this"
    var rating: Int = 0
    let imageUrl = URL(string: "https://cf.geekdo-images.com/rpwCZAjYLD940NWwP3SRoA__small/img/YT6svCVsWqLrDitcMEtyazVktbQ=/fit-in/200x150/filters:strip_icc()/pic4718279.jpg")!
    var body: some View {
        HStack {
            WebImage(url: imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 400)
                        .clipped()
            Text(title)
                
        }
    }
}

#Preview {
    BoardGameCardView()
}
