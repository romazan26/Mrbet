//
//  HealthDownFailView.swift
//  Mrbet
//
//  Created by Роман on 23.09.2024.
//

import SwiftUI

struct HealthDownFailView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.failIncom)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            Text("Your health has decreased!")
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(223), height: scaleScreen_y(235))
                .foregroundStyle(.white)
        }
        .onTapGesture {
            vm.healthUpFail = false
        }
    }
}

#Preview {
    HealthDownFailView(vm: PlayerViewModel())
}
