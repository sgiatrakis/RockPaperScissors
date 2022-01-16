//
//  BaseNavItem.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 16/1/22.
//

import SwiftUI

struct BaseNavItem: View {
    
    @Binding var viewAlert: BaseAlert
    
    var body: some View {
        NavigationLink(destination: LeaderBoardView()) {
            Image("leaderboard")
        }
    }
    
}


struct BaseNavItem_Previews: PreviewProvider {
    static var previews: some View {
        return BaseNavItem(viewAlert: .constant(BaseAlert()))
    }
}
