//
//  TransferView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import SwiftUI
import CodeScanner
struct TransferView: View {
    @State private var showScanner = false
    @State private var showRecipient = false
    @State private var showScannerRecipient = false
    @State private var txtNameRecip = ""
    @State private var txtRecipAddres = ""
    var body: some View {
        VStack(alignment: .leading){
          
            Text("")
            Text("Who are you seding to?").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold()
           
            Button(action: {
                self.showScanner = true
            }){
                HStack {
                    Text("Scan QR Code").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold()
                }
            }
            .frame(maxWidth: 150, minHeight: 45).border(Color.white)
            .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
            .border(Color.white)
            .padding(.vertical,5)
            .sheet(isPresented: $showScanner){
                CodeScannerView(codeTypes: [.qr], simulatedData: "SIMULATED DATA TEST", completion: self.scanQRCode)
            }
            Button(action:{
                self.showRecipient = true
            }){
                Label("Add a new recipient", systemImage: "person.circle").font(.custom("Nunito Sans Regular", size: 20)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
            }
            .sheet(isPresented: $showRecipient){
                VStack(alignment: .leading){
                    Text("")
                    Text("Name of recipient").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                    TextField("", text: self.$txtNameRecip).frame(maxWidth: .infinity, minHeight: 60).border(Color.white)
                    Text("Recipient's address").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                    TextField("", text: self.$txtRecipAddres).frame(maxWidth: .infinity, minHeight: 60).border(Color.white)
                    HStack{
                        Spacer()
                        Button(action:{
                            self.showScannerRecipient = true
                        }){
                            Text("Scan QR Code").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                        }.frame(maxWidth: 150, minHeight: 45).border(Color.white)
                        .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
                        .border(Color.white)
                        .sheet(isPresented: $showScannerRecipient){
                            CodeScannerView(codeTypes: [.qr], simulatedData: "SIMULATED DATA TEST", completion: self.scanQRCode)
                        }
                        
                    }.padding()
                    
                    Text("Recipient's Payment ID(optional)").font(.custom("Nunito Sans Regular", size: 18)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255))
                    TextField("", text: self.$txtRecipAddres).frame(maxWidth: .infinity, minHeight: 60).border(Color.white)
                    Button(action: {
                        
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
                    Spacer()
                }.padding()
            }
            Text("")
            Text("")
            Text("Address Book")
            Text("")
            Text("Your address book is empty! And a new recipient above to populate it.").frame(maxWidth: 300, minHeight: 45)
            Spacer()
        }
       
    }
    func scanQRCode(result: Result<String, CodeScannerView.ScanError>) {
         self.showScanner = false
         switch result {
         case  .success(let QRCode):
             do {
                 print(QRCode)
                
             } catch {
                 
             }
             
         case .failure(let error):
             self.showScanner = false
             print(error.localizedDescription)
             
         }
     }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
