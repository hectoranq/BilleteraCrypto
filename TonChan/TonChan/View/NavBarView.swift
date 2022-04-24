//
//  NavBarView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 20/5/21.
//

import SwiftUI

struct NavBarView: View {
    // TODO: this variable is not taking into account for now.
    @State var routeToReturn: String;
    @ObservedObject var viewRouter: ViewRouter
    @State var title = "";
    @State var showBackButton = false
    @State var showSettingIcon = false
    @State var goToLastRoute = true
    static let navbarHeight: CGFloat = 100
    static let navbarBackgroundHeight: CGFloat = 130
    
    var body: some View {
        ZStack {
            
            HStack {
                //Spacer()
                Button(action: {
                    viewRouter.currentPage = goToLastRoute ? viewRouter.lastRoute : routeToReturn
                  
                    
                }) {
                    Image(systemName:"arrow.backward")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.white)
                        .padding(.leading, 14)
                }.disabled(!showBackButton)
                
                Spacer()
                Spacer()
                Image("logoheaderblack")
                    .resizable()
                    .frame(width: 161, height:44)
                Spacer()
                Spacer()
               
                //Spacer()
            }
            .padding(.top, -50)
            .frame(height: 40)
            
        
        }
        .background(Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255))
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(routeToReturn: "", viewRouter: ViewRouter())
    }
}
