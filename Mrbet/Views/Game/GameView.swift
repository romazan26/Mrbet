//
//  GameView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: PlayerViewModel
    @StateObject var player: Player
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            //MARK: - BackGround View
            
            Image(vm.getBackgroundImage(player: player))
                .resizable()
                .scaleEffect(x: 1.05, y: 1.05)
                .ignoresSafeArea()
            
            //MARK: - Top Toolbar
            VStack {
                HStack {
                    //MARK: - Menu buttom
                    Button(action: {dismiss()}, label: {
                        Image(.menu)
                            .resizable()
                            .frame(width: scaleScreen_x(52), height: scaleScreen_y(52))
                    })
                    
                    Spacer()
                    Image(.name)
                        .resizable()
                        .frame(width: scaleScreen_x(270), height: scaleScreen_y(52))
                    
                }
                HStack{
                    DaysCountView(days: vm.daysSince(date: player.dataStart ?? Date()))
                    Spacer()
                    VStack(spacing: 5) {
                        //MARK: - Health button
                        NavigationLink {
                            HealthUpView(vm: vm, player: player)
                        } label: {
                            HealthView(health: player.health)
                        }
                        MoneyView(money: player.money)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: - Player image
            Image(vm.getPlayerImage(player: player))
                .resizable()
                .frame(width: scaleScreen_x(380), height: scaleScreen_y(650))
                .offset(y: 80)
            
            
            
            //MARK: - Bottom tool bar
            ZStack {
                Image(.backbottomTollbar)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: scaleScreen_y(150))
                    .frame(maxWidth: .infinity)
                HStack{
                    ///Cheats
                    Button("cheat") {
                        vm.chaetMoney(player: player)
                    }
                    //MARK: - Purchases button
                    NavigationLink {
                        PurchasesView(vm: vm, player: player)
                    } label: {
                        Image(.purchasess)
                            .resizable()
                            .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                    }
                    
                    //MARK: - Income button
                    NavigationLink {
                        IncomeView(vm: vm, player: player)
                    } label: {
                        Image(.income)
                            .resizable()
                            .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                    }
                    
                    //MARK: - training button
                    NavigationLink {
                        TraningsView(vm: vm, player: player)
                    } label: {
                        Image(.training)
                            .resizable()
                            .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                    }
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    GameView( vm: PlayerViewModel())
//}
