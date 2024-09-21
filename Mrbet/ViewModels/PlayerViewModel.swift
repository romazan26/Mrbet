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
    
    @Published var failIncome = false
    @Published var successIncome = false
    @Published var conditions = false
    @Published var conditionsText = ""
    
    @Published var trainingText = ""
    @Published var trainingVictory = false
    @Published var trainingDefeat = false
    
    @Published var newMoney: Int64 = 0
    init(){
        getPlayers()
    }
    
    //MARK: - Training player
    func trainingPlayer(player: Player, training: Trainings){
        switch training{
            
        case .TreatTheManager:
            if player.training < 1{
                if player.money >= 5000{
                    player.money -= 5000
                    player.training = 1
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
                    trainingVictory = true
                    trainingText = "Manage the casino"
                }else{
                    trainingDefeat = true
                    trainingText = "150000"
                }
            }
        }
        
        savePlayers()
    }
    
    //MARK: - Income
    func income(income: Income, player: Player){
        let percents = Int.random(in: 1...100)
        switch income{
            
        case .FindingMoneyOnTheFloor:
            if percents < 30{
                newMoney = Int64.random(in: 70...200)
                player.money -= newMoney
                failIncome = true
                
            }
            if (30...100) .contains(percents) {
                newMoney = Int64.random(in: 0...300)
                player.money += newMoney
                successIncome = true
            }
        case .CleaningOfPremises:
            if player.training > 0{
                if percents < 20{
                    newMoney = Int64.random(in: 150...400)
                    player.money -= newMoney
                    failIncome = true
                    
                }
                if (20...50) .contains(percents) {
                    newMoney = 0
                    failIncome = true
                }
                if (50...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...800)
                    player.money += newMoney
                    successIncome = true
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
                    failIncome = true
                    
                }
                if (20...50) .contains(percents) {
                    newMoney = 0
                    failIncome = true
                }
                if (50...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...2000)
                    player.money += newMoney
                    successIncome = true
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
                    failIncome = true
                    
                }
                if (50...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...5000)
                    player.money += newMoney
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
                    failIncome = true
                    
                }
                if (60...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...25000)
                    player.money += newMoney
                    successIncome = true
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
                    failIncome = true
                    
                }
                if (60...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...45000)
                    player.money += newMoney
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
                    failIncome = true
                    
                }
                if (60...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...100000)
                    player.money += newMoney
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
                    failIncome = true
                    
                }
                if (60...100) .contains(percents) {
                    newMoney = Int64.random(in: 0...1000000)
                    player.money += newMoney
                    successIncome = true
                }
            }else {
                conditions = true
                conditionsText = "Bay a casino \n Manage the casino"
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
        simplePlayer = players.last
        
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
