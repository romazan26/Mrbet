//
//  SaveGameCell.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct SaveGameCell: View {
    @ObservedObject var player: Player
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            //MARK: - Background
            Image(.backToCell)
                .resizable()
            HStack(spacing: 20) {
                //MARK: - Image player
                Image(vm.getMiniImage(player: player))
                    .resizable()
                    .frame(width: scaleScreen_x(100), height: scaleScreen_x(100))
                
                VStack(alignment: .leading) {
                    Text("Kevin Ball")
                        .LondrinaRegular(scaleScreen_x(20))
                    //MARK: - Monet player
                    Text("$ \(player.money)")
                        .LondrinaRegular(scaleScreen_x(32))
                }.foregroundStyle(.white)
                Spacer()
                
                //MARK: - Game button
                
                    Image(.rigrhtButton)
                        .resizable()
                        .frame(width: scaleScreen_x(52), height: scaleScreen_x(52))
                        .padding(.trailing, 25)
              
            }
        }.frame(height: scaleScreen_x(100))
    }
}

//#Preview {
//    SaveGameCell(player: Player())
//}
