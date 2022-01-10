//
//  BaseView.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 10/1/22.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    @Binding var viewAlert: BaseAlert
    
    let content: Content
    
    /// BaseView initialization
    /// - Parameters:
    ///   - viewAlert: ViewModel's baseAlert
    init(viewAlert: Binding<BaseAlert> = .constant(BaseAlert()),
         @ViewBuilder content: () -> Content) {
        self._viewAlert = viewAlert
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            VStack {
                // Content starts here
                content
            }.frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .infinity, alignment: .topLeading)
        }
        .alert(isPresented: $viewAlert.show) {
            Alert(title: Text("") , message: Text(viewAlert.message))
        }
    }
    
}
