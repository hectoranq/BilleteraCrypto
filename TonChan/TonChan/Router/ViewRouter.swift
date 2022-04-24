//
//  ViewRouter.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 19/5/21.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "Inicio" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var lastRoute: String = "Inicio" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
