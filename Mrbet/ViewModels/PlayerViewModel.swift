//
//  PlayerViewModel.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import Foundation
import CoreData

final class PlayerViewModel: ObservableObject{
    
    //MARK: - Property
    let manager = CoreDataManager.instance
    
    @Published var players:[Player] = []
    @Published var simplePlayer: Player!
    
    @Published var isPresentGame = false
    @Published var isPresentSeletect = false
    @Published var healthAlert = false
    
    @Published var failIncome = false
    @Published var successIncome = false
    @Published var conditions = false
    @Published var conditionsText = ""
    
    @Published var trainingText = ""
    @Published var trainingVictory = false
    @Published var trainingDefeat = false
    
    @Published var SuccessPurchases = false
    @Published var FailPurchases = false
    @Published var purchasesText = ""
    
    @Published var newMoney: Int64 = 0
    init(){
        getPlayers()
    }
    
    //MARK: - Cheats
    func chaetMoney(player: Player){
        player.money += 2000000
        savePlayers()
    }
    
   
    //Mark: - Day off
    
    func daysSince(date: Date) -> String {
            let currentDate = Date()
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.day], from: date, to: currentDate)
            
        return String(components.day ?? 0) 
        
    }


    //MARK: Health
    func addHealth(player: Player, health: Health){
        let percents = Int.random(in: 1...100)
        if player.health != 100 {
        switch health{
            
        case .FindFood:
            if percents < 50{
                player.health -= 5
                if player.health < 0{
                    player.health = 0
                }
                
            }
            if (50...100) .contains(percents) {
                player.health += 5
                if player.health > 100{
                    player.health = 100
                }
            }
        case .HaveAcoffee:
            if percents < 40{
                player.health -= 10
                if player.health < 0{
                    player.health = 0
                }
                
            }
            if (40...100) .contains(percents) {
                player.health += 10
                if player.health > 100{
                    player.health = 100
                }
            }
        case .ToEatInACafe:
            if player.money >= 500{
                player.money -= 500
                player.health += 15
                if player.health > 100{
                    player.health = 100
                }
            }else{
                trainingDefeat = true
                trainingText = "500"
            }
        case .ToEatAtTheRestaurant:
            if player.money >= 5000{
                player.money -= 5000
                player.health += 30
                if player.health > 100{
                    player.health = 100
                }
            }else{
                trainingDefeat = true
                trainingText = "5000"
            }
        case .HireAChef:
            if player.money >= 50000{
                player.money -= 50000
                player.health += 25
                player.health = 100
            }else{
                trainingDefeat = true
                trainingText = "50000"
            }
        }
        }
        savePlayers()
        
    }
    
    //MARK: Get actual image
    func getPlayerImage(player: Player) -> ImageResource{
        switch player.level{
        case 1: return PlayerImage.leve1.playerImage
        case 2: return PlayerImage.level2.playerImage
        case 3: return PlayerImage.level3.playerImage
        case 4: return PlayerImage.level4.playerImage
        case 5: return PlayerImage.level5.playerImage
        case 6: return PlayerImage.level6.playerImage
        case 7: return PlayerImage.level7.playerImage
            
        default:
            return PlayerImage.leve1.playerImage
        }
    }
    
    func getBackgroundImage(player: Player) -> ImageResource{
        switch player.level{
        case 1: return PlayerImage.leve1.backImage
        case 2: return PlayerImage.level2.backImage
        case 3: return PlayerImage.level3.backImage
        case 4: return PlayerImage.level4.backImage
        case 5: return PlayerImage.level5.backImage
        case 6: return PlayerImage.level6.backImage
        case 7: return PlayerImage.level7.backImage
            
        default:
            return PlayerImage.leve1.backImage
        }
    }
    
    func getMiniImage(player: Player) -> ImageResource{
        switch player.level{
        case 1: return PlayerImage.leve1.playerIcon
        case 2: return PlayerImage.level2.playerIcon
        case 3: return PlayerImage.level3.playerIcon
        case 4: return PlayerImage.level4.playerIcon
        case 5: return PlayerImage.level5.playerIcon
        case 6: return PlayerImage.level6.playerIcon
        case 7: return PlayerImage.level7.playerIcon
            
        default:
            return PlayerImage.leve1.playerIcon
        }
    }
    
    //MARK: - Purchases player
    func buyPurcheses(player: Player, purchases: Purchases){
        if player.health <= 0{
            healthAlert = true
        }else{
            switch purchases{
                
            case .buyAform:
                if player.money >= 20000{
                    player.money -= 20000
                    player.level = 2
                    player.health -= 2
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you have bought the form"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 20000"
                }
            case .buyAsuit:
                if player.money >= 35000{
                    player.money -= 35000
                    player.level = 3
                    player.health -= 4
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you have bought the suit"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 35000"
                }
            case .buyGlasses:
                if player.money >= 30000 && player.level == 3{
                    player.money -= 30000
                    player.level = 4
                    player.health -= 5
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you have bought the glass"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 30000 and Have not suit"
                }
            case .buyAslatMachine:
                if player.money >= 100000 {
                    player.money -= 100000
                    player.level = 5
                    player.health -= 10
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you have bought the slot Machine"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 100000"
                }
            case .rentAroom:
                if player.money >= 250000 {
                    player.money -= 250000
                    player.level = 6
                    player.health -= 15
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you rent a room"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 250000"
                }
            case .buyAcasino:
                if player.money >= 10000000 {
                    player.money -= 10000000
                    player.level = 7
                    player.health -= 20
                    if player.health < 0{ player.health = 0 }
                    SuccessPurchases = true
                    purchasesText = "Congratulations, you have bought the casino"
                }else{
                    FailPurchases = true
                    purchasesText = "Have not enough money, 10000000"
                }
            }
        }
    }
    
    //MARK: - Training player
    func trainingPlayer(player: Player, training: Trainings){
        if player.health <= 0{
            healthAlert = true
        }else{
            switch training{
                
            case .TreatTheManager:
                if player.training < 1{
                    if player.money >= 5000{
                        player.money -= 5000
                        player.training = 1
                        player.health -= 10
                        if player.health < 0{ player.health = 0 }
                        trainingVictory = true
                        trainingText = "TreatTheManager"
                    }else{
                        trainingDefeat = true
                        trainingText = "5000"
                    }
                }
            case .GetPokerTraining:
                if player.training < 2{
                    if player.money >= 50000{
                        player.money -= 50000
                        player.training = 2
                        player.health -= 20
                        if player.health < 0{ player.health = 0 }
                        trainingVictory = true
                        trainingText = "Get poker training"
                    }else{
                        trainingDefeat = true
                        trainingText = "50000"
                    }
                }
            case .ManageTheCasino:
                if player.training < 3{
                    if player.money >= 150000{
                        player.money -= 15000
                        player.training = 3
                        player.health -= 30
                        if player.health < 0{ player.health = 0 }
                        trainingVictory = true
                        trainingText = "Manage the casino"
                    }else{
                        trainingDefeat = true
                        trainingText = "150000"
                    }
                }
            }
        }
        
        savePlayers()
    }
    
    //MARK: - Income
    func income(income: Income, player: Player){
        let percents = Int.random(in: 1...100)
        if player.health <= 0{
            healthAlert = true
        }else{
            switch income{
                
            case .FindingMoneyOnTheFloor:
                if percents < 30{
                    newMoney = Int64.random(in: 70...200)
                    player.money -= newMoney
                    player.health -= 2
                    if player.health < 0{ player.health = 0 }
                    failIncome = true
                    
                }
                if (30...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...300)
                    player.money += newMoney
                    player.health -= 2
                    if player.health < 0{ player.health = 0 }
                    successIncome = true
                }
            case .CleaningOfPremises:
                if player.training > 0{
                    if percents < 20{
                        newMoney = Int64.random(in: 150...400)
                        player.money -= newMoney
                        player.health -= 3
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (20...50) .contains(percents) {
                        newMoney = 0
                        failIncome = true
                        player.health -= 3
                        if player.health < 0{ player.health = 0 }
                    }
                    if (50...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...800)
                        player.money += newMoney
                        successIncome = true
                        player.health -= 3
                        if player.health < 0{ player.health = 0 }
                    }
                }else {
                    conditions = true
                    conditionsText = "Treat the manager"
                }
            case .DeliverOrders:
                if player.level > 1{
                    if percents < 20{
                        newMoney = Int64.random(in: 300...1000)
                        player.money -= newMoney
                        player.health -= 4
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (20...50) .contains(percents) {
                        newMoney = 0
                        failIncome = true
                        player.health -= 4
                        if player.health < 0{ player.health = 0 }
                    }
                    if (50...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...2000)
                        player.money += newMoney
                        successIncome = true
                        player.health -= 4
                        if player.health < 0{ player.health = 0 }
                    }
                }else {
                    conditions = true
                    conditionsText = "Buy a form"
                }
            case .PlaySlotMachines:
                if player.level > 2 && player.money >= 50000{
                    if percents < 50{
                        newMoney = Int64.random(in: 500...player.money)
                        player.money -= newMoney
                        player.health -= 5
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (50...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...5000)
                        player.money += newMoney
                        player.health -= 5
                        if player.health < 0{ player.health = 0 }
                        successIncome = true
                    }
                }else {
                    conditions = true
                    conditionsText = "Have 50000$ in your account \n Buy a suit"
                }
            case .PlayingPoker:
                if player.level > 3 && player.money >= 90000 && player.training > 1{
                    if percents < 60{
                        newMoney = Int64.random(in: 500...(player.money / 100 * 8))
                        player.money -= newMoney
                        player.health -= 6
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (60...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...25000)
                        player.money += newMoney
                        successIncome = true
                        player.health -= 6
                        if player.health < 0{ player.health = 0 }
                    }
                }else {
                    conditions = true
                    conditionsText = "Have 90000$ in your account \n Buy a Glasses \n Get poker training"
                }
            case .PutDownYourMachine:
                if player.level > 4{
                    if percents < 60{
                        newMoney = Int64.random(in: 500...(player.money / 100 * 8))
                        player.money -= newMoney
                        player.health -= 8
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (60...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...45000)
                        player.money += newMoney
                        player.health -= 8
                        if player.health < 0{ player.health = 0 }
                        successIncome = true
                    }
                }else {
                    conditions = true
                    conditionsText = "Buy a slot machine"
                }
            case .OrganizeAPokerTournament:
                if player.level > 5{
                    if percents < 60{
                        newMoney = Int64.random(in: 500...(player.money / 100 * 25))
                        player.money -= newMoney
                        player.health -= 15
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (60...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...100000)
                        player.money += newMoney
                        player.health -= 15
                        if player.health < 0{ player.health = 0 }
                        successIncome = true
                    }
                }else {
                    conditions = true
                    conditionsText = "Rent a room"
                }
            case .OrganizeACasinoFestival:
                if player.level > 6 && player.training > 2{
                    if percents < 60{
                        newMoney = Int64.random(in: 500...(player.money / 100 * 45))
                        player.money -= newMoney
                        player.health -= 30
                        if player.health < 0{ player.health = 0 }
                        failIncome = true
                        
                    }
                    if (60...100) .contains(percents) {
                        newMoney = Int64.random(in: 0...1000000)
                        player.money += newMoney
                        player.health -= 30
                        if player.health < 0{ player.health = 0 }
                        successIncome = true
                    }
                }else {
                    conditions = true
                    conditionsText = "Bay a casino \n Manage the casino"
                }
            }
        }
        savePlayers()
    }
    
    //MARK: - Add data
    func addPlayer(){
        let newPlayer = Player(context: manager.context)
        newPlayer.dataStart = Date()
        newPlayer.money = 0
        newPlayer.health = 100
        newPlayer.level = 1
        newPlayer.training = 0
        
        savePlayers()
        
    }
    
    //MARK: - Get data
    func getPlayers(){
        let reqest = NSFetchRequest<Player>(entityName: "Player")
        do{
            players = try manager.context.fetch(reqest)
        }catch let error{
            print("Error fetch Players: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func savePlayers(){
        players.removeAll()
        manager.save()
        getPlayers()
    }
}
