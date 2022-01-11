//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    @State var activeSelection = 0
    
    var body: some View {
        BaseView() {
            VStack(spacing: 20) {
                VStack {
                    Text("CPU")
                        .bold()
                    HStack {
                        Image("rock")
                            .opacity(0.2)
                        Image("paper")
                            .opacity(0.2)
                        Image("scissors")
                            .opacity(0.2)
                    }
                    Text("CPU answered at \(Date.now).")
                }
                VStack {
                    Text("YOU")
                        .bold()
                    HStack {
                        Button {
                            activeSelection = 1
                        } label: {
                            Image("rock")
                                .opacity(activeSelection == 1 ? 1.0 : 0.2)
                        }
                        Button {
                            activeSelection = 2
                        } label: {
                            Image("paper")
                                .opacity(activeSelection == 2 ? 1.0 : 0.2)
                        }
                        Button {
                            activeSelection = 3
                        } label: {
                            Image("scissors")
                                .opacity(activeSelection == 3 ? 1.0 : 0.2)
                        }
                    }
                }
                VStack {
                    Button {
                    } label: {
                        BaseTextLink(customText: "CHECK FOR RESULT", bgColor: .pink)
                    }
                }
                .padding(.top, 15)
                Spacer()
            }
        }.navigationBarTitle("Play New Game")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


//frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .topLeading)
