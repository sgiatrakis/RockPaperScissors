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
    var showTopLine: Bool = true
    var showNavItem: Bool = false
    
    /// BaseView initialization
    /// - Parameters:
    ///   - viewAlert: ViewModel's baseAlert
    init(viewAlert: Binding<BaseAlert> = .constant(BaseAlert()),
         showTopLine: Bool = true,
         showNavItem: Bool = false,
         @ViewBuilder content: () -> Content) {
        self._viewAlert = viewAlert
        self.showTopLine = showTopLine
        self.showNavItem = showNavItem
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            VStack {
                if showTopLine {
                    Divider()
                        .frame(width: .none, height: 3.0)
                        .background(.pink)
                        .padding(.top, 8)
                }
                // Content starts here
                content
            }.frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarItems(trailing: showNavItem ? BaseNavItem(viewAlert: $viewAlert) : nil)
        .alert(isPresented: $viewAlert.show) {
            Alert(title: Text("") , message: Text(viewAlert.message))
        }
    }
    
}
