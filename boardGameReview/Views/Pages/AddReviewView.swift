//
//  AddReviewView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 1/4/26.
//

import SwiftUI

struct AddReviewView: View {
    let boardGameID: Int
    @State var rating: Int
    @State private var text: String = ""
    @ObservedObject private var viewModel = ReviewViewModel()
    var body: some View {
        HStack {
            Text("Your Rating:")
                .font(.title)
            Stars(rating: $rating)
        }
        .padding(.top,10)
        Rectangle()
            .stroke(Color.gray)
            .frame(height:1)
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding()
            if text.isEmpty {
                Text("Write your review here...")
                    .foregroundColor(.gray)
                    .opacity(0.50)
                    .padding()
                    .padding(.top,8)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Post") {
                    Task {
                        let reviewModel = ReviewModel(
                            id: nil,
                            board_game_id: boardGameID,
                            user_id: 1,
                            rating: rating,
                            comment: text
                        )
                        await viewModel.postReview(reviewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    AddReviewView(boardGameID: 0, rating: 0)
}
