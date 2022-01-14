//
//  GameEngine.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 13/1/22.
//

import Foundation

public enum UserChoice: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

public enum GameResult: String {
    case user = "User won! 😁"
    case cpu = "CPU won! 😥"
    case draw = "We have a draw! 😐"
}

public struct GameResponse {
    var gameResult: GameResult = .draw
    var descriptionText: String = ""
}

class GameEngine {
    
    init() {}
    
    var gameResponse = GameResponse()
    
    public func getGameResult(cpuAnswer: UserChoice?, userAnswer: UserChoice?) -> GameResponse? {
        guard let cpuAnswer = cpuAnswer,
              let userAnswer = userAnswer else { return nil }
        
        switch (cpuAnswer, userAnswer) {
        case (.rock, .rock):
            gameResponse = GameResponse(gameResult: .draw, descriptionText: nothingBeats)
            return gameResponse
        case (.rock, .paper):
            gameResponse = GameResponse(gameResult: .user, descriptionText: paperBeatsRock)
            return gameResponse
        case (.rock, .scissors):
            gameResponse = GameResponse(gameResult: .cpu, descriptionText: rockBeatsScissors)
            return gameResponse
        case (.paper, .rock):
            gameResponse = GameResponse(gameResult: .cpu, descriptionText: paperBeatsRock)
            return gameResponse
        case (.paper, .paper):
            gameResponse = GameResponse(gameResult: .draw, descriptionText: nothingBeats)
            return gameResponse
        case (.paper, .scissors):
            gameResponse = GameResponse(gameResult: .user, descriptionText: scissorsBeatsPaper)
            return gameResponse
        case (.scissors, .rock):
            gameResponse = GameResponse(gameResult: .user, descriptionText: rockBeatsScissors)
            return gameResponse
        case (.scissors, .paper):
            gameResponse = GameResponse(gameResult: .cpu, descriptionText: scissorsBeatsPaper)
            return gameResponse
        case (.scissors, .scissors):
            gameResponse = GameResponse(gameResult: .draw, descriptionText: nothingBeats)
            return gameResponse
        }
    }
    
    private func updateRealm() {
        // TODO
    }
    
}
