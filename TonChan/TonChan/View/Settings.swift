//
//  Settings.swift
//  TonChan
//
//  Created by -------------- on 19/5/21.
//

import SwiftUI

struct Settings: View {
    var iconos = ["questionmark.circle","key","note.text","backward.fill", "battery.100.bolt", "arrow.left.arrow.right","dollarsign.circle", "wifi.slash","sun.max", "shield.lefthalf.fill", "shield.lefthalf.fill","bell.fill","hammer.fill", "goforward", "applelogo", "tray.and.arrow.down.fill", "gobackward", "trash.fill", "info.circle"]
    var titulo = ["FAQ","Backup Keys","View logs","Rewind Wallet", "Speed Up Background Syncing", "Swap Node","Swap Currency", "Limit data","Enable dark mode", "Enable PIN/Fingerprint confirmation", "Change login method", "Enable Notifications", "Scan Coinbase Transactions", "Enable Auto Optimization", "View Kryptokrona on the App Store", "Find Kryptokrona on Github", "Resync Wallet", "Delete Wallet", "Kryptokrona Mobile Wallet"]
    var descripcion = ["Find answers to common questions","Display your private keys/seed","View debugging information","Rescan last 5000 blocks for missing transactions", "Disable battery optimization to speed up background syncing", "Use an alternative daemon to sync your wallet","Swap your wallet display currency", "Only sync when connected to WiFi","Swap between light and dark mode", "Require auth for sensitive operations", "Use Pin, Fingerprint, or No Security", "Get notified when you are sent money", "Enable this if you have solo mined", "Helps sending large TXs (See FAQ)", "Leave a rating or send the link to your friends", "View the source code and give feedback", "Resync wallet from scratch", "Delete your wallet", "v1.0.0"]
    
    var body: some View {
            List{
                ForEach(0 ..< iconos.count){ value in
                    cell(iconView: iconos[value], tituloView: titulo[value], descripcionView: descripcion[value])
                }
               
            }
        
       
    }
    
    func cell(iconView: String, tituloView: String, descripcionView: String)-> some View{
        Button(action: {
           
        }){
            HStack{
                Image(systemName: iconView).resizable().frame(width: 25, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                VStack(alignment: .leading){
                    Text("\(tituloView)").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                    Text("\(descripcionView)").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

