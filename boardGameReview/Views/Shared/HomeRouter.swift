//
//  HomeRouter.swift
//  boardGameReview
//
//  Created by Robert Fusting on 1/4/26.
//

import SwiftUI

final class HomeRouter: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: HomeRoute) { path.append(route) }
    func pop() { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path = NavigationPath() }
}
