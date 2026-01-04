//
//  BoardGameDesignerModel.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/31/25.
//

import Foundation

struct BoardGameDesingnerModel: Identifiable, Codable{
    let id: Int
    let name: String
}

struct BoardGameDesingers: Codable {
    let designers: [BoardGameDesingnerModel]
}
