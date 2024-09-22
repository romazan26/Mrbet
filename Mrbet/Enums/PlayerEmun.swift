//
//  PlayerEmun.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//
import SwiftUI

enum PlayerImage: CaseIterable{
    case leve1
    case level2
    case level3
    case level4
    case level5
    case level6
    case level7
    
    var backImage: ImageResource {
        switch self {
            
        case .leve1: .start
        case .level2: .backlevel2
        case .level3: .backlevel2
        case .level4: .backlevel4
        case .level5: .backlevel5
        case .level6: .backlevel6
        case .level7: .backlevel7
        }
    }
    
    var playerImage: ImageResource {
        switch self {
            
        case .leve1: .startPlayer
        case .level2: .playerlevel2
        case .level3: .playerlevel3
        case .level4: .playerlevel4
        case .level5: .playerlevel4
        case .level6: .playerlevel6
        case .level7: .playerlevel7
        }
    }
    var playerIcon: ImageResource {
        switch self{
            
        case .leve1: .miniStart
        case .level2: .mini2
        case .level3: .mini3
        case .level4: .mini4
        case .level5: .mini5
        case .level6: .mini6
        case .level7: .mini7
        }
    }
}
