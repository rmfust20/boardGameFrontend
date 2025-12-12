//
//  ComputedRatingView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/12/25.
//

import SwiftUI

struct ComputedRatingView: View {
    let boardGameID : Int = 0
    @State private var averageRating: Double = 3.5
    @State private var numberOfRatings: Int = 120
    @State private var numberOfReviews: Int = 45
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                if index < Int(averageRating.rounded(.down)) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                        .font(.system(size:13))
                }
                else if index == Int(averageRating.rounded(.down)) && averageRating.truncatingRemainder(dividingBy: 1) >= 0.5 {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundStyle(Color.yellow)
                        .font(.system(size:13))
                }
                else {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.gray)
                        .opacity(0.25)
                        .font(.system(size:13))
                }
            }
            Text(String(format: "%.1f", averageRating))
                .font(.system(size:13))
                .foregroundStyle(Color.gray)
            Text(String("(\(numberOfRatings))"))
                .font(.system(size:13))
                .foregroundStyle(Color.gray)
            Text(String("· \(numberOfReviews) Reviews"))
                .font(.system(size:13))
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    ComputedRatingView()
}
