//
//  VictoryTrainingView.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct VictoryTrainingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.victoryTraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text("Congratulations, you have \(vm.trainingText)")
                .LondrinaRegular(30)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(223), height: scaleScreen_y(235))
                .foregroundStyle(.white)
        }.onTapGesture {
            vm.trainingVictory = false
            dismiss()
        }
    }
}

#Preview {
    VictoryTrainingView(vm: PlayerViewModel())
}
