//
//  TimeHelper.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 11/1/22.
//

import Foundation

class TimeHelper {
    
    public static let shared = TimeHelper()
    
    func getCurrentSeconds() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.second, from: date)
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        return df.string(from: date)
    }
    
}
