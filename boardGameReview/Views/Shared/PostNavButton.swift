//
//  PostNavButton.swift
//  boardGameReview
//
//  Created by Robert Fusting on 1/7/26.
//

import SwiftUI

struct PostNavButton: View {
    var body: some View {
        Button {
            Listener.shared.setChange()
        } label: { Text("Post")
        }
        .buttonStyle(.plain)
        
    }
}

