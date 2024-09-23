//
//  FailIncomeView.swift
//  Mrbet
//
//  Created by Роман on 21.09.2024.
//

import SwiftUI

struct FailIncomeView: View {
    @StateObject var vm: PlayerViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.failIncom)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            VStack {
                Text("Penalty for poor performance")
                    .LondrinaRegular(32)
                    .multilineTextAlignment(.center)
                Text("- $ \(vm.newMoney)")
                    .LondrinaRegular(32)
            }
            .frame(width: scaleScreen_x(233), height: scaleScreen_y(235))
            .foregroundStyle(.white)
        }.onTapGesture {
            vm.failIncome = false
            dismiss()
        }
    }
}

#Preview {
    FailIncomeView(vm: PlayerViewModel())
}
