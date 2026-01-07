//
//  boardGameReviewApp.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/6/25.
//

import SwiftUI

@main
struct boardGameReviewApp: App {
    @StateObject var boardGameViewModel = BoardGameViewModel()
    @StateObject var reviewViewModel = ReviewViewModel()
    var body: some Scene {
        WindowGroup {
            BottomNavBarView()
        }
    }
}
