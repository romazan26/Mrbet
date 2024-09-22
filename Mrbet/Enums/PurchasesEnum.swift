//
//  PurchasesEnum.swift
//  Mrbet
//
//  Created by Роман on 17.09.2024.
//

import SwiftUI

enum Purchases: CaseIterable, Identifiable {
    case buyAform
    case buyAsuit
    case buyGlasses
    case buyAslatMachine
    case rentAroom
    case buyAcasino
    
    var level: Int {
        switch self {
        case .buyAform: 2
        case .buyAsuit: 3
        case .buyGlasses: 4
        case .buyAslatMachine: 5
        case .rentAroom: 6
        case .buyAcasino: 7
        }
    }
    
    var text: String {
        switch self{
        case .buyAform: "Buy a form"
        case .buyAsuit: "Buy a suit"
        case .buyGlasses: "Buy Glasses"
        case .buyAslatMachine: "Buy a slot machine"
        case .rentAroom: "Rent a room"
        case .buyAcasino: "Buy a casino"
        }
    }
    
    var price: Int64 {
        switch self{ 
        case .buyAform: 20000
        case .buyAsuit: 35000
        case .buyGlasses: 30000
        case .buyAslatMachine: 100000
        case .rentAroom: 250000
        case .buyAcasino: 1000000
        }
    }
    
    var image: ImageResource {
        switch self {
        case .buyAform:  .form
        case .buyAsuit: .suit
        case .buyGlasses: .glasses
        case .buyAslatMachine: .slotMachine
        case .rentAroom: .room
        case .buyAcasino: .casino
        }
    }
    var id: Self{
        self
    }

}
