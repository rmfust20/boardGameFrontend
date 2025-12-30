//
//  BottomNavBarView.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/12/25.
//

import SwiftUI

enum Tab: Hashable {
    case home, profile
}

struct BottomNavBarView: View {
    @State private var selectedTab: Tab = .home
    var body: some View {
        TabView(selection: $selectedTab) {

                    HomeNavRootView(selectedTab: $selectedTab)
                        .tabItem { Label("Home", systemImage: "house") }
                        .tag(Tab.home)

                    NavigationStack {
                        ProfileView(userID: 0)
                    }
                    .tabItem { Label("Profile", systemImage: "person") }
                    .tag(Tab.profile)
        }
    }
}

#Preview {
    BottomNavBarView()
}
