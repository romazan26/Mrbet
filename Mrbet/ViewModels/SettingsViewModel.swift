//
//  SettingsViewModel.swift
//  Mrbet
//
//  Created by Роман on 17.09.2024.
//

import Foundation
import SwiftUI

final class SettingsViewModel: ObservableObject{
    @AppStorage("volumeMusic") var volumeMusic: String?
    @AppStorage("volumeSound") var volumeSound: String?
    
    let sound = SoundManager.instance
    let music = MusicManager.instance
    
    init() {
        soundsSlider = Float(volumeSound ?? "0") ?? 0
        musicSlider = Float(volumeMusic ?? "0") ?? 0
    }
        
    @Published var musicSlider: Float = 1 {
        didSet{
            music.player?.volume = Float(musicSlider)
        }
    }
    @Published var soundsSlider: Float = 1 {
        didSet {
            sound.player?.volume = Float(soundsSlider)
        }
    }
    
    @Published var isPresentShare = false
    @Published var isPresentPolicy = false
    @Published var urlShare = "https://www.apple.com/app-store/"
    
    //MARK: - Save settings
    func save(){
        volumeMusic = String(musicSlider)
        volumeSound = String(soundsSlider)
    }
}
