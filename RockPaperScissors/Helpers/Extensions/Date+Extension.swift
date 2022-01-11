//
//  Date+Extension.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 11/1/22.
//

import Foundation

extension Date {
    func currentTimestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
