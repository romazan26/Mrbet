//
//  DefeatTrainingView.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct DefeatTrainingView: View {
    @StateObject var vm: PlayerViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.defeattraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text("You don't have \(vm.trainingText)$")
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(233), height: scaleScreen_y(235))
                .foregroundStyle(.white)
        }.onTapGesture {
            vm.trainingDefeat = false
            dismiss()
        }
    }
}

#Preview {
    DefeatTrainingView(vm: PlayerViewModel())
}
