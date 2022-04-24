//
//  ContentView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import SwiftUI
import AppLocker
struct ContentView: View {
    @ObservedObject var viewRouter: ViewRouter
    @Environment(\.managedObjectContext) var contexto
    @FetchRequest(entity: Preferences.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Preferences.id, ascending: true)
    ]) var preferncias : FetchedResults<Preferences>
    var body: some View {
        ZStack{
            Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255).edgesIgnoringSafeArea(.all)
            VStack{
                Text("")
                Text("")
                Text("")
                
                Image("xkr-logo-dark-0").resizable()
                    .frame(maxWidth: .infinity, maxHeight: 262).padding()
              
                Text("kryptokrona").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold()
                Text("a nordic cryptocurrency").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255))
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = "terms"
                }){
                    HStack {
                        Text("CREATE NEW WALLET")
                            .foregroundColor(Color(.white))
                            .font(Font.custom("Nunito Sans", size: 15))
                            .bold()
                    }.frame(maxWidth: .infinity, minHeight: 40)
                }
                .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 17)
                Button(action: {
                    
                }){
                    HStack {
                        Text("RECOVER WALLET")
                            .foregroundColor(Color(.white))
                            .font(Font.custom("Nunito Sans", size: 15))
                            .bold()
                    }.frame(maxWidth: .infinity, minHeight: 40)
                }
                .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 17)
                
                
            }
        }.onAppear(perform: {
            
          
            
           // let prdata = Preferences.mostrarPreferencia()
            if preferncias.count  <= 0 {
                let nuevaPreferecia = Preferences(context: self.contexto)
                nuevaPreferecia.id = 0
                nuevaPreferecia.currency = "usd"
                nuevaPreferecia.notificationsenabled = true
                nuevaPreferecia.scancoinbasetransactions = false
                nuevaPreferecia.limitdata = false
                nuevaPreferecia.theme = "darkMode"
                nuevaPreferecia.pinconfirmation = false
                nuevaPreferecia.autooptimize = true
                nuevaPreferecia.authmethod = "hardware-auth"
                nuevaPreferecia.node = "?"
                do{
                    try self.contexto.save()
                    print("Guardo correctamente")
                }catch let error as NSError {
                    print("Error al guardar", error.localizedDescription)
                }
            }else{
                if preferncias[0].authmethod == "pincode" {
                   
                    AppLocker.present(with: .validate)
                    self.viewRouter.currentPage = "main"
                }
            }
           
        })
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
