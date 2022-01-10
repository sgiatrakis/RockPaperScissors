//
//  StartingView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 4/1/22.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationView {
            BaseView() {
                VStack(spacing: 20) {
                    Text("Rock-Paper-Scissors Game App")
                    .padding(.horizontal)
                    .frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .none, alignment: .topLeading)
                    VStack(spacing: 40) {
                        NavigationLink(destination: GameView()) {
                            BaseTextLink(customText: "PLAY GAME!")
                        }
                        NavigationLink(destination: GameView()) {
                            BaseTextLink(customText: "LEADERBOARD", bgColor: .pink)
                        }
                        NavigationLink(destination: GameView()) {
                            BaseTextLink(customText: "ABOUT", fgColor: .yellow, bgColor: .indigo)
                        }
                    }
                    .padding(.top, 30)
                    Spacer()
                    .navigationTitle("Welcome!")
                }
            }
        }
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
