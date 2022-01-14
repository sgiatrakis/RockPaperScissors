//
//  UserStars.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import Foundation

public struct PlayerStats: Hashable {
    
    var name: String
    var wins: Int
    
    public static func == (lhs: PlayerStats, rhs: PlayerStats) -> Bool {
        return lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
