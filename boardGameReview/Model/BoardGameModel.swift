//
//  BoardGameModel.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/6/25.
//

import Foundation

struct BoardGameModel: Identifiable, Codable {
    let id : Int
    let name : String
    let thumbnail : String?
    let play_time : Int?
    let min_players : Int?
    let max_players : Int?
    let year_published : Int?
    let description : String?
    let min_age : Int?
    let image : String?
}
