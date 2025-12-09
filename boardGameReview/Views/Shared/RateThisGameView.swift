//
//  RateThisGameView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/7/25.
//

import SwiftUI

struct RateThisGameView: View {
    var body: some View {
        HStack {
            Text("Rate this game:")
                .foregroundStyle(Color.gray)
                .font(.system(size:13))
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.gray)
                    .opacity(0.25)
                    .font(.system(size:13))
            }
        }
    }
}

#Preview {
    RateThisGameView()
}
