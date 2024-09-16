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
    
    @Published var isPresentGame = false
    
    init(){
        getPlayers()
    }
    
    //MARK: - Add data
    func addPlayer(){
        let newPlayer = Player(context: manager.context)
        newPlayer.dataStart = Date()
        newPlayer.money = 0
        newPlayer.health = 100
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
