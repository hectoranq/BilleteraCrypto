//
//  PinView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 31/5/21.
//

import SwiftUI

struct PinView: View {
    @State var status = false
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
                
                Verification(viewRouter: self.viewRouter)
                
                
            }.background(Color(.white)).clipShape(Rounded())
            .edgesIgnoringSafeArea(.all)
            .padding(.top, NavBarView.navbarHeight)
            
            
        }
       
        
    }
}

struct Home : View {

    var body : some View{
        
        Text("Home")
    }
}

struct Verification : View {
    @ObservedObject var viewRouter: ViewRouter
    @State var code : [String] = []
    
    var body : some View{
        
        VStack(alignment: .center){
            
            Spacer()
            
            Text("1 - Enter a PIN Code").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold()
            Text("to keep your Kryptokrona secure").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255)).bold()
            
            HStack(spacing: 20){
                
                ForEach(code,id: \.self){i in
                    
                    Text(i).font(.title).fontWeight(.semibold)
                }
                
            }.padding(.vertical)
            
            Spacer()
            
            NumberPad(viewRouter: self.viewRouter, codes: $code)
            
        } .frame(width: UIScreen.main.bounds.width)
        .background(Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255))
    }
}



struct NumberPad : View {
    @ObservedObject var viewRouter: ViewRouter
    @Binding var codes : [String]
    
    var body : some View{
        
        VStack(alignment: .leading,spacing: 20){
            
            ForEach(datas){i in
                
                HStack(spacing: self.getspacing()){
                    
                    ForEach(i.row){j in
                        
                        Button(action: {
                            
                            if j.value == "delete.left.fill"{
                             
                                self.codes.removeLast()
                            }
                            else{
                                
                                self.codes.append(j.value)
                                
                                if self.codes.count == 6{
                                    
                                    print(self.getCode())
                                    
                                    // use this code for verification and post the notification when the code is verified....
                                    
                                    self.viewRouter.currentPage = "main"
                                    
                                    self.codes.removeAll()
                                }
                            }
                            
                        }) {
                            
                            if j.value == "delete.left.fill"{
                                
                                Image(systemName: j.value).font(.body).padding(.vertical)
                            }
                            else{
                                
                                Text(j.value).font(.title).fontWeight(.semibold).padding(.vertical)
                            }
                            
                            
                        }
                    }
                }
                
            }
            
        }.foregroundColor(.white)
    }
    
    func getspacing()->CGFloat{
        
        return UIScreen.main.bounds.width / 3
    }
    
    func getCode()->String{
        
        var code = ""
        
        for i in self.codes{
        
            code += i
            
        }

        return code.replacingOccurrences(of: " ", with: "")
    }
}


// datas...

struct type : Identifiable {
    
    var id : Int
    var row : [row]
}

struct row : Identifiable {
    
    var id : Int
    var value : String
}

var datas = [

type(id: 0, row: [row(id: 0, value: " 1"),row(id: 1, value: "2"),row(id: 2, value: "3")]),
type(id: 1, row: [row(id: 0, value: "4"),row(id: 1, value: "5"),row(id: 2, value: "6")]),
type(id: 2, row: [row(id: 0, value: "7"),row(id: 1, value: "8"),row(id: 2, value: "9")]),
type(id: 3, row: [row(id: 0, value: "delete.left.fill"),row(id: 1, value: "0")])
]


struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView(viewRouter: ViewRouter())
    }
}
