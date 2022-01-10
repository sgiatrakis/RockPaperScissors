//
//  BaseTextLink.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import SwiftUI

struct BaseTextLink: View {
    
    var customText: String
    var fgColor: Color = .white
    var bgColor: Color = .blue
    
    var body: some View {
        Text(customText)
            .foregroundColor(fgColor)
            .bold()
            .padding(10)
            .frame(width: 220)
            .background(bgColor)
            .clipShape(Capsule())
    }
    
}

struct BaseTextLink_Previews: PreviewProvider {
    static var previews: some View {
        BaseTextLink(customText: "PLAY NOW")
    }
}
