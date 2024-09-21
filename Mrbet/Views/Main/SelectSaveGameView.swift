//
//  SelectSaveGameView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct SelectSaveGameView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            //MARK: - BackGround View
            Image(.start)
                .resizable()
                .scaleEffect(x: 1.05, y: 1.05)
                .ignoresSafeArea()
            VStack{
                //MARK: - Top tool bar
                HStack{
                    //MARK: - Back button
                    Button(action: {dismiss()}, label: {
                        Image(.backButton)
                            .resizable()
                            .frame(width: scaleScreen_x(52), height: 52)
                    })
                    
                    Spacer()
                    
                    //MARK:  View label
                    Image(.selectSaveLabel)
                        .resizable()
                        .frame(width: scaleScreen_x(270), height: scaleScreen_x(52))
                }
                ScrollView {
                    ForEach(vm.players) { player in
                        NavigationLink {
                            GameView(vm: vm, player: player)
                            
                        } label: {
                            SaveGameCell(player: player)
                        }
                    }
                    
                }
                .padding(.top)
                Spacer()
            }.padding()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    SelectSaveGameView( vm: PlayerViewModel())
}
