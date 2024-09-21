//
//  IncomeEnum.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

enum Income: CaseIterable, Identifiable {
    case FindingMoneyOnTheFloor
    case CleaningOfPremises
    case DeliverOrders
    case PlaySlotMachines
    case PlayingPoker
    case PutDownYourMachine
    case OrganizeAPokerTournament
    case OrganizeACasinoFestival
    
    var text: String {
        switch self{
        case .FindingMoneyOnTheFloor: "Finding money on the floor"
        case .CleaningOfPremises: "Cleaning of premises"
        case .DeliverOrders: "Deliver orders"
        case .PlaySlotMachines: "Play slot machines"
        case .PlayingPoker: "Playing Poker"
        case .PutDownYourMachine: "Put down your machine"
        case .OrganizeAPokerTournament: "Organize a poker tournament"
        case .OrganizeACasinoFestival: "Organize a casino festival"
        }
    }
    
    var maxPrice: Int64 {
        switch self{
        case .FindingMoneyOnTheFloor: 300
        case .CleaningOfPremises: 800
        case .DeliverOrders: 2000
        case .PlaySlotMachines: 5000
        case .PlayingPoker: 25000
        case .PutDownYourMachine: 45000
        case .OrganizeAPokerTournament: 100000
        case .OrganizeACasinoFestival: 1000000
        }
    }
    
    var image: ImageResource {
        switch self {
        
        case .FindingMoneyOnTheFloor: .findingMoney
        case .CleaningOfPremises: .cleaning
        case .DeliverOrders: .deliver
        case .PlaySlotMachines: .playSlotMachines
        case .PlayingPoker: .playingPoker
        case .PutDownYourMachine: .putDownYourMachine
        case .OrganizeAPokerTournament: .pokerTournament
        case .OrganizeACasinoFestival: .casinoFestival
        }
    }
    var id: Self{
        self
    }

}
