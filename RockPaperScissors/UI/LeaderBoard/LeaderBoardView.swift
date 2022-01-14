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
            
            ForEach((0..<viewModel.playerStats.count)) { index in
                HStack {
                    VStack {
                        BaseFullWidthHStack(text: String(index + 1))
                    }
                    VStack {
                        BaseFullWidthHStack(text: viewModel.playerStats[index].name)
                    }
                    VStack {
                        BaseFullWidthHStack(text: String(viewModel.playerStats[index].wins))
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
        LeaderBoardView()
    }
}

