//
//  LeaderBoardView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    @StateObject var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        BaseView(viewAlert: $viewModel.viewAlert) {
            HStack {
                VStack {
                    BaseFullWidthHStack(text: "№ #")
                }
                VStack {
                    BaseFullWidthHStack(text: "PLAYER")
                }
                VStack {
                    BaseFullWidthHStack(text: "WINS")
                }
            }.frame(maxWidth: .infinity)
            
            ForEach(Array(viewModel.playerStats.enumerated()), id: \.element) { index, player in
                HStack {
                    VStack {
                        BaseFullWidthHStack(text: String(index + 1), bgColor: .mint)
                    }
                    VStack {
                        BaseFullWidthHStack(text: player.name, bgColor: .mint)
                    }
                    VStack {
                        BaseFullWidthHStack(text: String(player.wins), bgColor: .mint)
                    }
                }.frame(maxWidth: .infinity)
                
            }
            
        }
        .navigationBarTitle("Leaderboard")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        // Dummy Data just for Preview
        let vm = LeaderBoardViewModel()
        let player1 = PlayerStats(name: "Lorem", wins: 45)
        let player2 = PlayerStats(name: "Ipsum", wins: 10)
        vm.playerStats.append(player1)
        vm.playerStats.append(player2)
        
        return LeaderBoardView(viewModel: vm)
    }
}

