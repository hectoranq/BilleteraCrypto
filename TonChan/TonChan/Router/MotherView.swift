//
//  MotherView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            if viewRouter.currentPage == "Inicio" {
                ContentView(viewRouter : viewRouter)
            } else if viewRouter.currentPage == "main" {
                MainView(viewRouter : viewRouter)
            
            } else if viewRouter.currentPage == "auth" {
                AuthenticateView(viewRouter : viewRouter)
            } else if viewRouter.currentPage == "terms" {
                TermsView(viewRouter : viewRouter)
            } else if viewRouter.currentPage == "pin" {
                PinView(viewRouter : viewRouter)
            } else
            {
                ContentView(viewRouter : viewRouter)
            }
            
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
