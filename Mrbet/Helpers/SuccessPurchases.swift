//
//  SuccessPurchases.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct SuccessPurchases: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.successIncome)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text(vm.purchasesText)
                .LondrinaRegular(32)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .frame(width: scaleScreen_x(213), height: scaleScreen_y(235))
        }.onTapGesture {
            vm.SuccessPurchases = false
        }
    }
}

#Preview {
    SuccessPurchases(vm: PlayerViewModel())
}
