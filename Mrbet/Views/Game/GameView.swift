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
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            //MARK: - BackGround View
            
                Image(.start)
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
                    DaysCountView(days: "15")
                    Spacer()
                    VStack(spacing: 5) {
                        HealthView(health: 99)
                        MoneyView(money: 1250)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: - Player image
                Image(.startPlayer)
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
                    Image(.purchases)
                        .resizable()
                        .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                    Image(.income)
                        .resizable()
                        .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                    Image(.training)
                        .resizable()
                        .frame(width: scaleScreen_x(106), height: scaleScreen_y(120))
                }
            }
        }
    }
}

#Preview {
    GameView( vm: PlayerViewModel())
}
