//
//  TrainingsEnum.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

enum Trainings: CaseIterable, Identifiable {
    case TreatTheManager
    case GetPokerTraining
    case ManageTheCasino
    
    var level: Int {
        switch self {
            
        case .TreatTheManager: 1
        case .GetPokerTraining: 2
        case .ManageTheCasino: 3
        }
    }
    
    var text: String {
        switch self{
            
        case .TreatTheManager: "Treat the manager"
        case .GetPokerTraining: "Get poker training"
        case .ManageTheCasino: "Manage the casino"
        }
    }
    
    var price: Int64 {
        switch self {
            
        case .TreatTheManager: 5000
        case .GetPokerTraining:  50000
        case .ManageTheCasino: 150000
        }
    }
    var image: ImageResource {
        switch self{
            
        case .TreatTheManager: .treat
        case .GetPokerTraining:  .pokerTraining
        case .ManageTheCasino:  .manage
        }
    }
    var id: Self{
        self
    }
    
    
    
}
