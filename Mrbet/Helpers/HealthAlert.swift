//
//  HealthAlert.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct HealthAlert: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.defeattraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text("You need to improve your health")
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(223), height: scaleScreen_y(235))
                .foregroundStyle(.red)
        }.onTapGesture {
            vm.healthAlert = false
        }
    }
}

#Preview {
    HealthAlert(vm: PlayerViewModel())
}
