//
//  TermsView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 20/5/21.
//

import SwiftUI

struct TermsView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255).edgesIgnoringSafeArea(.all)
            VStack {
                
                GeometryReader{_ in
                    NavBarView(routeToReturn: "Inicio", viewRouter: viewRouter, showBackButton: true, showSettingIcon: true, goToLastRoute: false).frame(height: NavBarView.navbarBackgroundHeight)
                }
                Spacer()
            }
            
            GeometryReader{_ in
                
                MainViewTerm(viewRouter: self.viewRouter)
                
                
            }.background(Color(.white)).clipShape(Rounded())
            .edgesIgnoringSafeArea(.all)
            .padding(.top, NavBarView.navbarHeight)
            
            
        }
    }
}

struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: [.topRight, .topLeft] , cornerRadii: CGSize(width: 1, height: 30))
        return Path(path.cgPath)
    }
}

struct MainViewTerm : View {
    @State private var showingInterface1 = false
    @State private var showingInterface2 = false
    @ObservedObject var viewRouter: ViewRouter
    var body: some View{
        ZStack{
            Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255).edgesIgnoringSafeArea(.all)
            
        }
        VStack(alignment: .center, spacing: 0.0){
            Text("Before we continue, please take a minute to read and agree to the below statements.").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold().frame(width: UIScreen.main.bounds.width)
            Text("")
            Text("")
            HStack{
                Toggle(isOn: self.$showingInterface1) {
                
                }
               
                Text("I understand that I am the sole owner of my pryvate keys/seed, and if l lose them, my wallet cannot be recovered").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold().frame(width: 310, height: 100, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
          
            }
            HStack{
                Toggle(isOn: self.$showingInterface2) {
                
                }
              
                Text("I understand that no warranty or guarantee is provided, expressed, or implied when using this app are not the responsability of the application creator, publisher, or distributor.").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold().frame(width: 310, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            Button(action: {
                if (self.showingInterface1 == true && self.showingInterface2 == true) {
                 
                    self.viewRouter.currentPage = "auth"
                    // for testing
                    //self.viewRouter.currentPage = SmartCredentialView.route
                    
                } else {
                    print("no checked")
                }
            }){
                HStack {
                    Text("CONTINUE")
                        .foregroundColor(Color(.white))
                        .font(Font.custom("Nunito Sans", size: 15))
                        .bold()
                }.frame(maxWidth: .infinity, minHeight: 40)
            }.disabled(self.showingInterface1 == false && self.showingInterface2 == false)
            .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, 17)
        }.padding()
        .frame(width: UIScreen.main.bounds.width)
        
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView(viewRouter: ViewRouter())
    }
}
