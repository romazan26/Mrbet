//
//  HealthUpView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct HealthUpView: View {
    @StateObject var vm: PlayerViewModel
    let player: Player
    var body: some View {
       
        ZStack {
            VStack{
                //MARK: - Top bar
                Topbar(text: "Health")
                    .padding()
                //MARK: - Health up list
                ScrollView {
                    ForEach(Health.allCases ,id: \.id) { hlth in
                        Button {
                            vm.addHealth(player: player, health: hlth)
                        } label: {
                            IncomeCellView( image: hlth.image,
                                            price: hlth.price,
                                            text: hlth.text)
                        }

                        
                    }
                }.padding()
            }
            .background(content: {
                Image(.purchases)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            })
            .navigationBarBackButtonHidden()
            
            if vm.FailPurchases {
                DefeatPurchases(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .loss)
                    }
            }
            if vm.healthUpFail {
                HealthDownFailView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .faiil)
                    }
            }
            if vm.healthUpSuccess {
                HealthUpSuccesView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .win)
                    }
            }
        }
    }
    
}

#Preview {
    HealthUpView(vm: PlayerViewModel(), player: Player())
}
