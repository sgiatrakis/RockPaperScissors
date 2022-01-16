//
//  AboutView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 16/1/22.
//

import SwiftUI

struct AboutView: View {
    
    @State var time: String = ""
    @State var seconds: String = ""
    @State var btcPrice: String = ""
    @State var cpuAnswer: UserChoice = .rock
    
    var body: some View {
        BaseView() {
            VStack(alignment: .leading, spacing: 14) {
                Text("Lysimachos Stephen Giatrakis")
                Text("sgiatrakis@gmail.com")
                Text("https://github.com/sgiatrakis")
                Text("(+30)6983460512")
            }.padding(16)
            Spacer()
        }
        .navigationBarTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

