//
//  LeaderBoardData.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import Foundation
import RealmSwift

final class LeaderBoardData: BaseData {
    
    public func createLeaderBoard() -> Bool {
        let leaderBoard = Leaderboard()
        leaderBoard.cpuWins = 0
        leaderBoard.userWins = 0
        return create(leaderBoard)
    }
    
    public func fetchLeaderBoard() -> Leaderboard? {
        guard let queryResult = realm?.objects(Leaderboard.self).first else { return nil }
        return queryResult
    }
    
    public func fetchLeaderBoardUserWins() -> Int? {
        guard let queryResult = realm?.objects(Leaderboard.self).first else { return nil }
        return queryResult.userWins
    }
    
    public func fetchLeaderBoardCPUWins() -> Int? {
        guard let queryResult = realm?.objects(Leaderboard.self).first else { return nil }
        return queryResult.cpuWins
    }
    
}
