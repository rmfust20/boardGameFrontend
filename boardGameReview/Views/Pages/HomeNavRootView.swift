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
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {

                    HomeView(
                        openUser: { userID in path.append(HomeRoute.userProfile(id: userID)) },
                        openGame: { gameID in path.append(HomeRoute.boardGame(id: gameID)) }
                    )
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

#Preview {
    //HomeNavRootView()
}
