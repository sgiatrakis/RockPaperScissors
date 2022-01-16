//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    @State var showResults = false
    
    var body: some View {
        BaseView(viewAlert: $viewModel.viewAlert, showNavItem: true) {
            if viewModel.isFetched {
                VStack(spacing: 20) {
                    VStack {
                        Text("CPU")
                            .bold()
                        HStack {
                            Image("rock")
                                .opacity((viewModel.cpuAnswer == .rock && showResults) ? 1.0 : 0.2)
                            Image("paper")
                                .opacity((viewModel.cpuAnswer == .paper && showResults) ? 1.0 : 0.2)
                            Image("scissors")
                                .opacity((viewModel.cpuAnswer == .scissors && showResults) ? 1.0 : 0.2)
                        }
                        Text("CPU answered at \(viewModel.currentTime)")
                    }
                    VStack {
                        Text("USER")
                            .bold()
                        HStack {
                            Button {
                                guard !showResults else { return }
                                viewModel.userAnswer = UserChoice(rawValue: 1)
                            } label: {
                                Image("rock")
                                    .opacity(viewModel.userAnswer == .rock ? 1.0 : 0.2)
                            }
                            Button {
                                guard !showResults else { return }
                                viewModel.userAnswer = UserChoice(rawValue: 2)
                            } label: {
                                Image("paper")
                                    .opacity(viewModel.userAnswer == .paper ? 1.0 : 0.2)
                            }
                            Button {
                                guard !showResults else { return }
                                viewModel.userAnswer = UserChoice(rawValue: 3)
                            } label: {
                                Image("scissors")
                                    .opacity(viewModel.userAnswer == .scissors ? 1.0 : 0.2)
                            }
                        }
                    }
                    VStack {
                        Button {
                            guard viewModel.gameEngine.getGameResult(cpuAnswer: viewModel.cpuAnswer, userAnswer: viewModel.userAnswer) != nil else { return }
                            showResults = true
                        } label: {
                            BaseTextLink(customText: "CHECK FOR RESULT", bgColor: .pink)
                                .opacity((viewModel.userAnswer != nil && !showResults) ? 1.0 : 0.0)
                        }
                        Button {
                            showResults = false
                            viewModel.restartGame()
                        } label: {
                            BaseTextLink(customText: "PLAY AGAIN", bgColor: .pink)
                                .opacity(showResults ? 1.0 : 0.0)
                        }
                    }
                    VStack {
                        Text("\(viewModel.gameEngine.gameResponse.gameResult.rawValue) \(viewModel.gameEngine.gameResponse.descriptionText)")
                    }.opacity(showResults ? 1 : 0)
                        .padding(.top, 15)
                    NavigationLink(destination: AntiCheatView(time: viewModel.currentTime,
                                                              seconds: String(viewModel.currentSeconds),
                                                              btcPrice: viewModel.btcPrice,
                                                              cpuAnswer: viewModel.cpuAnswer ?? .rock)) {
                        BaseTextLink(customText: "CPU ANTI-CHEAT", bgColor: .cyan)
                    }.opacity(showResults ? 1.0 : 0.0)
                    Spacer()
                }
            } else {
                Spacer()
                BaseLoader()
                Spacer()
            }
        }
        .navigationBarTitle("Play New Game")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameViewModel()
        vm.isFetched = true
        return GameView(viewModel: vm, showResults: true)
    }
}
