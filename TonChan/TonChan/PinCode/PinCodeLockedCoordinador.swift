//
//  PinCodeLockedCoordinador.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 6/6/21.
//

import Foundation
import SwiftUI
import AppLocker
struct PinCodeLockedCoordinador: UIViewControllerRepresentable {
    let controller = AppLocker()
    func makeUIViewController(context: Context) -> UIViewController {
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
       
    }
    
    func makeCoordinator() -> Cordinator {
        Cordinator(self)
    }
    
    class Cordinator: NSObject{
        var parent: PinCodeLockedCoordinador
        init(_ pageViewController: PinCodeLockedCoordinador) {
            self.parent = pageViewController
        }
    }
  
}

