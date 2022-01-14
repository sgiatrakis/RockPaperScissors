//
//  BaseFullWidthHStack.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import SwiftUI

struct BaseFullWidthHStack: View {
    
    let text: String
    let bgColor: Color = .indigo

    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .bold()
                .foregroundColor(.white)
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .background(.cyan)
        .border(.indigo, width: 3)
    }
    
}

struct BaseFullWidthHStack_Previews: PreviewProvider {
    static var previews: some View {
        BaseFullWidthHStack(text: "Preview")
    }
}
