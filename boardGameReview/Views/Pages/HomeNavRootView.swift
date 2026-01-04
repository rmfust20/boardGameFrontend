//
//  HomeNavRootView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/13/25.
//

import SwiftUI

enum HomeRoute: Hashable {
    case userProfile(id: Int)
    case boardGame(id: Int)
}

struct HomeNavRootView: View {
    @Binding var selectedTab: Tab
    @StateObject private var router = HomeRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .environmentObject(router)
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .userProfile(let id):
                        ProfileView(userID: id)
                    case .boardGame(let id):
                        BoardGameView(boardGameID: id)
                    }
                }
        }
    }
}
