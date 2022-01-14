//
//  Leaderboard.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import Foundation
import RealmSwift

final class Leaderboard: Object {
    
    @Persisted var userWins: Int
    @Persisted var cpuWins: Int
    
}
