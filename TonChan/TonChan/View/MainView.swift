//
//  MainView.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import SwiftUI
import CryptoSwift
import CoreImage.CIFilterBuiltins
struct MainView: View {
    @ObservedObject var viewRouter: ViewRouter
    init(viewRouter: ViewRouter) {
        UITabBar.appearance().backgroundColor = .black
        self.viewRouter = viewRouter
    }
    var body: some View {
        
        TabView{
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            TransactionsView().tabItem {
                Image(systemName: "list.bullet")
                Text("Transactions")
            }
            
            TransferView().tabItem {
                Image(systemName: "paperplane.fill")
                Text("Transfer")
            }
            
            RecipientsView().tabItem {
                Image(systemName: "person.2")
                Text("Recipients")
            }
            
            Settings().tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }.accentColor(.white)
    }
}

struct HomeView: View {
    var body: some View{
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            Text("Your Wallet Address:").font(.custom("Nunito Sans Regular", size: 25)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold().frame(width: UIScreen.main.bounds.width)
            Image("qr_img.php").resizable()
                .scaledToFit()
                .frame(maxWidth: 307, maxHeight: 307, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack{
                Spacer()
                Text("SEKReV1GtmXV1AYAd5NZJx34W2pMw8bzHj8uSZP4pFQoGwoPNgynR2i9u7T8G2Go8VStpJJsVcV5CVo7kZm7yhHnVb1vww22qL6").font(.custom("Nunito Sans Regular", size: 21)).foregroundColor(Color(red: 113 / 255, green: 113 / 255, blue: 113 / 255)).bold().frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            Button(action: {
                UIPasteboard.general.string = "SEKReV1GtmXV1AYAd5NZJx34W2pMw8bzHj8uSZP4pFQoGwoPNgynR2i9u7T8G2Go8VStpJJsVcV5CVo7kZm7yhHnVb1vww22qL6"
            }){
                HStack {
                    Text("Copy")
                        .foregroundColor(Color(.white))
                        .font(Font.custom("Nunito Sans", size: 15))
                        .bold()
                }
            }
            .frame(maxWidth: 100, minHeight: 40).border(Color.white)
            .background(Color(red: 47 / 255, green: 47 / 255, blue: 47 / 255))
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, 17)
          
        }
        .onAppear(perform: {
           
            let key = "1234567Bar12345B"
            //let keyJsonEncript = aes_Encrypt(AES_KEY: key, hexString: "helloWorld")
            //let keyJsonEncript2 = try! AESencrypt()
            //let enrip = try! aesEncryptOtr(key: key)
            
        })
         
    }
    
    func generateQRCode(from string: String) -> UIImage {
            let context = CIContext()
            let filter = CIFilter.qrCodeGenerator()
            let data = Data(string.utf8)
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let outputImage = filter.outputImage?.transformed(by: transform) {
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgimg)
                }
            }
            
            return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func aes_Encrypt(AES_KEY: String, hexString: String) -> String {
          var result = ""
         do {
             let key: [UInt8] = Array(AES_KEY.utf8) as [UInt8]
             let aes = try! AES(key: key, blockMode: ECB(), padding: .pkcs7) // AES128 .ECB pkcs7
             let data = Data(base64Encoded: hexString.base64Encoded()!)
             let encrypted = try aes.encrypt(Array(data!))
             result = encrypted.toHexString()
             print("AES Encryption Result: \(result)")
         } catch {
            print("Error: \(error)")
         }
         return result
        
    }
    
    
    func AESencrypt() throws -> String  {
        
        //Mark: You have to do the same thing in Android too. If u skip this here skip in android too
        let secretKeyTest = "1234567Bar12345B".base64Encoded()
        
        
        let inputBytes: [UInt8] = Array("helloWorld".utf8)
        let key:        [UInt8] = Array(secretKeyTest!.utf8) //16
        //let iv:         [UInt8] = Array("0000000000000000".utf8)  //16
        
        var encryptedBase64 = ""
        do
        {
            let encrypted: [UInt8] = try AES(key: key, blockMode: ECB()).encrypt(inputBytes)
            let encryptedNSData = NSData(bytes: encrypted, length: encrypted.count)
            encryptedBase64 = encryptedNSData.base64EncodedString(options: [])
            
            //Mark: You have to do the same thing in Android too. If u skip this here skip in android too
            encryptedBase64=encryptedBase64.base64Encoded()!
            
            //Mark: Follow the same blockMode in both platform. ECB Mode is not recommended. I did it in ECB cuz it was already done in other platform
            let decrypted: [UInt8] = try AES(key: key, blockMode: ECB()).decrypt(encrypted)
            let result = String(bytes: decrypted, encoding: String.Encoding.utf8)!
            print("result\t\(result )")
        }
        catch
        {
            print("FAIL ENCRYPT")
        }
        print("encryptedBase64: \(encryptedBase64)")
        
        return encryptedBase64
        
    }
    
 
    func aesEncryptOtr(key: String) throws -> String {
            
            var result = ""
            
            do {
                
                let key: [UInt8] = Array(key.utf8) as [UInt8]
                
                let aes = try! AES(key: key, blockMode: ECB() , padding:.pkcs5) // AES128 .ECB pkcs7
                
                let encrypted = try aes.encrypt(Array("helloWorld".utf8))
                
                result = encrypted.toBase64()!
                
                
                print("AES Encryption Result: \(result)")
                
            } catch {
                
                print("Error: \(error)")
            }
            
            return result
        }
    
}

extension String {
//: ### Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }

//: ### Base64 decoding a string
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}
