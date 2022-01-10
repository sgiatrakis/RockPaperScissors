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
                    Text("Welcome to the game!")
                    .padding(.horizontal)
                    .frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .none, alignment: .topLeading)
                    NavigationLink(destination: GameView()) {
                        Text("PLAY NOW")
                            .foregroundColor(.white)
                            .bold()
                            .padding(10)
                            .background(.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.top, 30)
                    Spacer()
                    .navigationTitle("Rock-Paper-Scissors")
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
