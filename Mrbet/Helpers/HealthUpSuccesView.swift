//
//  HealthUpView.swift
//  Mrbet
//
//  Created by Роман on 23.09.2024.
//

import SwiftUI

struct HealthUpSuccesView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.victoryTraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            Text("Your health has improved!")
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(223), height: scaleScreen_y(235))
                .foregroundStyle(.white)
        }
        .onTapGesture {
            vm.healthUpSuccess = false
        }
    }
}

#Preview {
    HealthUpSuccesView(vm: PlayerViewModel())
}
