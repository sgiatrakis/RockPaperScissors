//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 11/1/22.
//

import Foundation

class GameViewModel: BaseViewModel {
    
    @Published var cpuAnswer: UserChoice?
    @Published var userAnswer: UserChoice?
    
    let gameEngine = GameEngine()
    
    override init() {
        super.init()
        fetchData()
    }
    
    public func fetchData() {
        Repository.shared.fetchBTCPrices { [weak self] btcPrices, error in
            guard let self = self else { return }
            
            // End Loading
            self.isFetched = true
            
            // Handle Error
            if let error = error {
                self.viewAlert.setActive(message: error.localizedDescription)
                return
            }
            
            guard let safeBtcPrices = btcPrices else {
                print("Response DTO unwrap error")
                return
            }
            
            print("VM Fetch Resulut: \(safeBtcPrices)")
            
            // Curent seconds
            let now = TimeHelper.shared.getCurrentSeconds()
            
            self.cpuAnswer = ResultCalculator.shared.fetchCPUResult(seconds: now, rate: safeBtcPrices.bpi.usd.rateText)
        }
    }
    
    private func getGameResult() -> String {
        return ""
    }
    
}
