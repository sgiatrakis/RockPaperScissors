//
//  BaseLoader.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import SwiftUI

struct BaseLoader: View {
    
    var body: some View {
        HStack(spacing: 6) {
            ProgressView()
            Text("Loading...")
                .foregroundColor(Color.gray)
                .font(.system(size: 18))
        }
    }
    
}
