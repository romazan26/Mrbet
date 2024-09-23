//
//  MainView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = PlayerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: - BackGround View
                Image(.start)
                    .resizable()
                    .scaleEffect(x: 1.05, y: 1.05)
                    .ignoresSafeArea()
                
                Image(.startPlayer)
                    .resizable()
                    .offset(x: 80, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
                //MARK: - Group of button
                if vm.isPresentSeletect {
                    NavigationLink {
                        GameView(vm: vm, player: vm.players.last!)
                            .onAppear {
                                SoundManager.instance.playSound(sound: .tapButton)
                            }
                        
                    } label: {
                        ZStack{
                            Image(.victoryTraining)
                                .resizable()
                                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
                            VStack {
                                Text("Congratulations, you have new mrBet!")
                                    .LondrinaRegular(30)
                                    .multilineTextAlignment(.center)
                                
                                    .foregroundStyle(.white)
                                Text("Start")
                                    .LondrinaRegular(30)
                                    .multilineTextAlignment(.center)
                                
                                    .foregroundStyle(.red)
                            }.frame(width: scaleScreen_x(203), height: scaleScreen_y(205))
                        }
                        
                    }
                }else{
                    VStack {
                        
                        //MARK: New game button
                        Button {
                            vm.isPresentSeletect = true
                            vm.addPlayer()
                            SoundManager.instance.playSound(sound: .tapButton)
                        } label: {
                            MenuButtonView(text: "New game", color: .yellowButton)
                        }
                        if !vm.players.isEmpty{
                            //MARK: Continue button
                            NavigationLink {
                                SelectSaveGameView(vm: vm)
                                    .onAppear(perform: {
                                        SoundManager.instance.playSound(sound: .tapButton)
                                    })
                            } label: {
                                MenuButtonView(text: "Continue", color: .pinkButton)
                            }
                        }
                        
                        //MARK: Settings button
                        NavigationLink {
                            SettingsView()
                                .onAppear(perform: {
                                    SoundManager.instance.playSound(sound: .tapButton)
                                })
                        } label: {
                            MenuButtonView(text: "Settings", color: .bluebuton)
                        }
                        //
                        //                    //MARK: Exit button
                        //
                        //                        MenuButtonView(text: "Exit", color: .greenButton)
                    }
                }
            }
            .onAppear {
                vm.isPresentSeletect = false
                    MusicManager.instance.playSound(sound: .backMenu)
                
                
            }
        }
    }
}

#Preview {
    MainView()
}
