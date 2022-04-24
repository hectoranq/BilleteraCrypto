//
//  AuthenticateView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 20/5/21.
//

import SwiftUI
import AppLocker
struct AuthenticateView: View {
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
                
                MainViewAutenti(viewRouter: self.viewRouter)
                
                
            }.background(Color(.white)).clipShape(Rounded())
            .edgesIgnoringSafeArea(.all)
            .padding(.top, NavBarView.navbarHeight)
            
            
        }
    }
}

struct ALOptions { // The structure used to display the controller
  var title: String?
  var subtitle: String?
  var image: UIImage?
  var color: UIColor?
  var isSensorsEnabled: Bool?
}




struct MainViewAutenti : View {
    @State private var showingfaceid = true
    @State private var showingpincode = false
    @State private var showingnouseauth = false
    @Environment(\.managedObjectContext) var contexto
    @FetchRequest(entity: Preferences.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Preferences.id, ascending: true)
    ]) var preferncias : FetchedResults<Preferences>
    @ObservedObject var viewRouter: ViewRouter
    var body: some View{
        ZStack {
            Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255).edgesIgnoringSafeArea(.all)
         
        }
            VStack(alignment: .leading){
                Text("How would you like to secure your wallet?").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold().frame(width: UIScreen.main.bounds.width)
                Text("")
                Text("")
                HStack{
                    Toggle(isOn: self.$showingfaceid) {
                        
                    }.onChange(of: self.showingfaceid, perform: { value in
                        print(value)
                        if value {
                            self.showingpincode = false
                            self.showingnouseauth = false
                        }
                    })
                    
                    Text("Use Hardware Authentication where available (Fingerprint, FaceID, TouchID), and if not available, fallback to a PIN Code.").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold().frame(width: 310, height: 100, alignment: .leading)
                }
                HStack{
                    
                    Toggle(isOn: self.$showingpincode) {
                    
                    }.onChange(of: self.showingpincode, perform: { value in
                        print(value)
                        if value {
                            self.showingfaceid = false
                            self.showingnouseauth = false
                        }
                    })
                  
                    Text("Use a 6 digit PIN Code.").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold().frame(width: 310, height: 50, alignment: .leading)
                   
                }
                HStack{
                    Toggle(isOn: self.$showingnouseauth) {
                    
                    }.onChange(of: self.showingnouseauth, perform: { value in
                        print(value)
                        if value {
                            self.showingfaceid = false
                            self.showingpincode = false
                        }
                    })
                  
                    Text(" Use no authentication at all.").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold().frame(width: 310, height: 50, alignment: .leading)
                   
                }
                Spacer()
          
               Button(action: {
                    
                    let accountPreferences =  self.preferncias[0]
                    
                 
                    if self.showingfaceid{
                        accountPreferences.authmethod = "hardware-auth"
                    }else if self.showingpincode {
                        accountPreferences.authmethod = "pincode"
                      
                    }else if self.showingnouseauth {
                        accountPreferences.authmethod = "none"
                    }
                    
                    do{
                        try self.contexto.save()
                        print("Edito correctamente")
                        
                    }catch let error as NSError {
                        print("Error al editar", error.localizedDescription)
                    }
                    
                    if self.showingfaceid{
                        self.viewRouter.currentPage = "main"
                    }else if self.showingpincode {
                        AppLocker.present(with: .create)
                        self.viewRouter.currentPage = "main"
                    }else if self.showingnouseauth {
                        self.viewRouter.currentPage = "main"
                    }
                    
               
                    
                }){
                    HStack {
                        Text("CONTINUE")
                            .foregroundColor(Color(.white))
                            .font(Font.custom("Nunito Sans", size: 15))
                            .bold()
                    }.frame(maxWidth: .infinity, minHeight: 40)
                }
                .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 17)
            }.background(Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255)).edgesIgnoringSafeArea(.all)
            .padding()
            .frame(width: UIScreen.main.bounds.width)
        
       
        
    }
}
struct AuthenticateView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateView(viewRouter: ViewRouter())
    }
}
