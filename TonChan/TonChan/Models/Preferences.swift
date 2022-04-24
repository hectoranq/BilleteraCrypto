//
//  Preferences.swift
//  TonChan
//
//  Created by Ivan Hector Aquino Apaza on 3/6/21.
//

import Foundation
import CoreData

class Preferences: NSManagedObject, Identifiable {
    @NSManaged public var id : Int
    @NSManaged public var currency : String
    @NSManaged public var notificationsenabled : Bool
    @NSManaged public var scancoinbasetransactions : Bool
    @NSManaged public var limitdata : Bool
    @NSManaged public var theme : String
    @NSManaged public var pinconfirmation : Bool
    @NSManaged public var autooptimize : Bool
    @NSManaged public var authmethod : String
    @NSManaged public var node : String
    
}
extension Preferences {
    static func mostrarPreferencia() -> NSFetchRequest<Preferences> {
        
        let request: NSFetchRequest<Preferences> = Preferences.fetchRequest() as! NSFetchRequest<Preferences>
        // SQL SELECT * FROM CONTACTOS
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        // SQL ORDERBY NOMBRE ASC
        return request
        
    }
}
