//
//  VictoryTrainingView.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct VictoryTrainingView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.victoryTraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text("Congratulations, you have \(vm.trainingText)")
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(233), height: scaleScreen_y(235))
                .foregroundStyle(.white)
        }.onTapGesture {
            vm.trainingVictory = false
        }
    }
}

#Preview {
    VictoryTrainingView(vm: PlayerViewModel())
}
