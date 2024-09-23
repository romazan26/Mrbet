//
//  GameOverView.swift
//  Mrbet
//
//  Created by Роман on 23.09.2024.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: PlayerViewModel
    let player: Player
    var body: some View {
       
        ZStack{
            ZStack {
                Color.black.opacity(0.5).ignoresSafeArea()
                Image(.failIncom)
                    .resizable()
                    .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
                Text("3 days health is 0. Game over!")
                    .LondrinaRegular(32)
                    .multilineTextAlignment(.center)
                    .frame(width: scaleScreen_x(213), height: scaleScreen_y(235))
                    .foregroundStyle(.white)
            }
        }.onTapGesture {
            dismiss()
            vm.deletePlayer(player: player)
        }
    }
}

//#Preview {
//    GameOverView()
//}
