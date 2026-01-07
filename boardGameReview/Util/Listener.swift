//
//  Listener.swift
//  boardGameReview
//
//  Created by Robert Fusting on 1/7/26.
//

import Foundation

class Listener : ObservableObject {
    static let shared = Listener()
    
    @Published private var change : Bool = false
    
    func setChange() {
        change.toggle()
        print(change)
    }
}
