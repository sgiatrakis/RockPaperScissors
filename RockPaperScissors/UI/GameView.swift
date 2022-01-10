//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import Foundation
import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationView {
            BaseView() {
                Text("Test")
            }
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
