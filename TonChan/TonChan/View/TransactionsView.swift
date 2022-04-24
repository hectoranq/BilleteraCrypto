//
//  TransactionsView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import SwiftUI

struct TransactionsView: View {
   
    var body: some View {
        VStack{
            Spacer()
            VStack{
                
                Text("Looks like you haven't sent or received any transactions yet!").font(.custom("Nunito Sans Regular", size: 21)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold().frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image(systemName: "eyes")
                
            }.border(Color.black)
          
            Spacer()
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
