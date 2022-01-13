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
    @State var showResults = false
    
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
                    Text("CPU answered at \(TimeHelper.shared.getCurrentTime())")
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
                        guard activeSelection != 0 else { return }
                        viewModel.userAnswer = UserChoice(rawValue: activeSelection)
                        guard viewModel.gameEngine.getGameResult(cpuAnswer: viewModel.cpuAnswer, userAnswer: viewModel.userAnswer) != nil else { return }
                        showResults = true
                    } label: {
                        BaseTextLink(customText: "CHECK FOR RESULT", bgColor: .pink)
                    }
                }
                VStack {
//                    let _ = print("RESULT cpu: \(viewModel.cpuAnswer) user: \(viewModel.userAnswer)")
                    Text("\(viewModel.gameEngine.gameResponse.gameResult.rawValue) \(viewModel.gameEngine.gameResponse.descriptionText)")
                }.opacity(showResults ? 1 : 0)
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
