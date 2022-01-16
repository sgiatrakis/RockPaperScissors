//  AntiCheat.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 13/1/22.
//

import SwiftUI

struct AntiCheatView: View {
    
    @State var time: String = ""
    @State var seconds: String = ""
    @State var btcPrice: String = ""
    @State var cpuAnswer: UserChoice = .rock
    
    var body: some View {
        BaseView(showNavItem: true) {
            VStack(alignment: .leading, spacing: 12) {
                Image("anti-cheat")
                Text("Explicitly in the last game:")
                    .bold()
                Text("CPU locked its answer at: \(time)")
                HStack {
                    Text("So, seconds were: ")
                    Spacer()
                    Text(seconds)
                        .foregroundColor(.red)
                        .bold()
                }
                Text("At this time BTC price was: \(btcPrice)")
                HStack {
                    Text("So BTC last digit was:")
                    Spacer()
                    if let lastChar = btcPrice.last {
                        Text(String(lastChar))
                            .foregroundColor(.red)
                            .bold()
                    }
                }
                HStack {
                    Text("Thus, CPU chose: ")
                        .bold()
                    Image(String(describing: cpuAnswer))
                        .resizable()
                        .frame(width: 50, height: 55)
                }
            }.padding(16)
            Spacer()
        }
        .navigationBarTitle("Anti-Cheat")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct AntiCheatView_Previews: PreviewProvider {
    static var previews: some View {
        AntiCheatView()
    }
}
