//
//  TraningsView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct TraningsView: View {
    @StateObject var vm: PlayerViewModel
    let player: Player
    var body: some View {
        ZStack {
            VStack{
                //MARK: - Top bar
                Topbar(text: "Training")
                    .padding()
                //MARK: - Training
                ScrollView {
                    ForEach(Trainings.allCases ,id: \.id) { training in
                        Button {
                            vm.trainingPlayer(player: player, training: training)
                        } label: {
                            TrainingCellView(player: player, training: training)
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
            if vm.trainingDefeat {
                DefeatTrainingView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .faiil)
                    }
            }
            if vm.trainingVictory {
                VictoryTrainingView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .success)
                    }
            }
            if vm.healthAlert {
                HealthAlert(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .faiil)
                    }
            }
        }
    }
}

#Preview {
    TraningsView(vm: PlayerViewModel(), player: Player())
}
