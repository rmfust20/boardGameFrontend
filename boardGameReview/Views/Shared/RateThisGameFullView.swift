//
//  RateThisGameFullView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/12/25.
//

import SwiftUI

struct RateThisGameFullView: View {
    var body: some View {
        Text("Rate This Game:")
            .foregroundStyle(Color.gray)
            .padding(.bottom,5)
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: "star")
                    .font(.title)
            }
        }
    }
}

#Preview {
    RateThisGameFullView()
}
