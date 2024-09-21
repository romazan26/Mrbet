//
//  HealthUnum.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

enum Health: CaseIterable, Identifiable{

    case FindFood
    case HaveAcoffee
    case ToEatInACafe
    case ToEatAtTheRestaurant
    case HireAChef
    
    var text: String{
        switch self{
        case .FindFood : "Find food on the table"
        case .HaveAcoffee: "Have a coffee"
        case .ToEatInACafe: "To eat in a cafe"
        case .ToEatAtTheRestaurant: "To eat at the restaurant"
        case .HireAChef: "Hire a chef"
        }
    }
    
    var price: Int64{
        switch self{
            
        case .FindFood: 0
        case .HaveAcoffee: 0
        case .ToEatInACafe: 500
        case .ToEatAtTheRestaurant: 5000
        case .HireAChef: 50000
        }
    }
    
    var image: ImageResource {
        switch self{
            
        case .FindFood: .findFood
        case .HaveAcoffee: .cofe
        case .ToEatInACafe: .eatInCafe
        case .ToEatAtTheRestaurant: .eatAtRestaurant
        case .HireAChef: .hireAChef
        }
    }
    
    var id: Self{
        self
    }
}
