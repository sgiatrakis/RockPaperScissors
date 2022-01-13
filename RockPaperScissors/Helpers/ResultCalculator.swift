//
//  ResultCalculator.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 11/1/22.
//

import Foundation

class ResultCalculator {
    
    public static let shared = ResultCalculator()
    
    public func fetchCPUResult(seconds: Int, rate: String) -> UserChoice? {        
        // Last Digit of BTC Rate
        let lastDigit = String(rate.last ?? "0")
        guard let lastDigitInt = Int(lastDigit) else { return nil }
        
        // Result
        let result = seconds + lastDigitInt
        
        // Last Char of Result
        guard let resultLastChar = String(result).last else { return nil }
        let resultLastString = String(resultLastChar)
        guard let resultLastInt = Int(resultLastString) else { return nil }
        
        switch resultLastInt {
        case 1,4,7:
            return UserChoice.rock
        case 2,5,8:
            return UserChoice.paper
        case 3,6,9:
            return UserChoice.scissors
        default:
            return nil
        }
    }
    
}
