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
                VStack {
                    //MARK: New game button
                    Button(action: {
                        vm.addPlayer()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            vm.isPresentGame = true
                        }
                        SoundManager.instance.playSound(sound: .tapButton)
                    }, label: {
                        MenuButtonView(text: "New game", color: .yellowButton)
                    })
                        
                    
                    
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
                    
                    //MARK: Exit button
            
                        MenuButtonView(text: "Exit", color: .greenButton)
                    

                }
            }
            .fullScreenCover(isPresented: $vm.isPresentGame, content: {
                GameView(vm: vm, player: vm.simplePlayer)
            })
        }
        
            
        
    }
}

#Preview {
    MainView()
}
