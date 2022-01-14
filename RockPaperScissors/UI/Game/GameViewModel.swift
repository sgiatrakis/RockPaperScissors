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
    @Published private (set) var currentTime: String = ""
    
    private (set) var currentSeconds: Int = 0
    private (set) var btcPrice: String = ""
    
    let gameEngine = GameEngine()
    
    override init() {
        super.init()
        fetchData()
    }
    
    private func fetchData() {
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
            
            // Curent Time CPU locked it's answer & BTC price
            self.currentTime = TimeHelper.shared.getCurrentTime()
            self.currentSeconds = TimeHelper.shared.getCurrentSeconds()
            self.btcPrice = String(safeBtcPrices.bpi.usd.rate)
            // CPU Calculated Result
            let cpuResult = ResultCalculator.shared.fetchCPUResult(seconds: self.currentSeconds, rate: self.btcPrice)
            
            // If ResultCalculator returns nil, that means we have a resultLastInt equal to 0 and we need to re-fetch for a different result.
            guard cpuResult != nil else {
                self.isFetched = false
                // Results Fetch as almost instant, so just for demo purposes we set a slight delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.fetchData()
                }
                return
            }
            
            self.cpuAnswer = cpuResult
        }
    }
    
    public func restartGame() {
        cpuAnswer = nil
        userAnswer = nil
        fetchData()
    }
    
}
