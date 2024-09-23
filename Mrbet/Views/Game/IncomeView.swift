//
//  IncomeView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct IncomeView: View {
    @StateObject var vm: PlayerViewModel
    let player: Player
    var body: some View {
        ZStack {
            VStack{
                //MARK: - Top bar
                Topbar(text: "Income")
                    .padding()
                //MARK: - Income
                ScrollView {
                    ForEach(Income.allCases ,id: \.id) { inc in
                        Button {
                            vm.income(income: inc, player: player)
                        } label: {
                            IncomeCellView(isIncome: true,
                                              image: inc.image,
                                              price: inc.maxPrice,
                                              text: inc.text)
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
            if vm.failIncome {
                FailIncomeView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .faiil)
                    }
            }
            if vm.successIncome {
                SuccessIncome(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .success)
                    }
            }
            if vm.conditions {
                ConditionsView(vm: vm)
                    .onAppear {
                        SoundManager.instance.playSound(sound: .loss)
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
    IncomeView(vm: PlayerViewModel(), player: Player())
}
