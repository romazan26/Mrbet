//
//  SuccessIncome.swift
//  Mrbet
//
//  Created by Роман on 21.09.2024.
//

import SwiftUI

struct SuccessIncome: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.successIncome)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            VStack {
                Text("Get the money")
                    .LondrinaRegular(32)
                Text("+ $ \(vm.newMoney)")
                    .LondrinaRegular(32)
            }
            .foregroundStyle(.white)
            .frame(width: scaleScreen_x(233), height: scaleScreen_y(235))
        }.onTapGesture {
            vm.successIncome = false
        }
    }
}

#Preview {
    SuccessIncome(vm: PlayerViewModel())
}
