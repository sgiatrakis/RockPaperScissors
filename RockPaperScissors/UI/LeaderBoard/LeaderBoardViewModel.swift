//
//  LeaderBoardViewModel.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import Foundation

class LeaderBoardViewModel: BaseViewModel {
    
    @Published var playerStats = [PlayerStats]()
    
    override init() {
        super.init()
        fetchLeaderBoard()
    }
    
    func fetchLeaderBoard() {
        guard let leaderBoard = RealmLayer.shared.leaderBoardData.fetchLeaderBoard() else { return }
        
        // Add Two Elements
        playerStats.append(PlayerStats(name: "User", wins: leaderBoard.userWins))
        playerStats.append(PlayerStats(name: "CPU", wins: leaderBoard.cpuWins))
        // Sort by Wins
        playerStats.sort { $0.wins > $1.wins }
    }
    
}
