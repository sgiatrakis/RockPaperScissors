//
//  BaseViewModel.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 11/1/22.
//

import Foundation
import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var isFetched: Bool = false
    @Published var viewAlert = BaseAlert()
    
}
