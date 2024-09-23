//
//  DefeatPurchases.swift
//  Mrbet
//
//  Created by Роман on 22.09.2024.
//

import SwiftUI

struct DefeatPurchases: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.defeattraining)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(235))
            
            Text("\(vm.purchasesText)")
                .LondrinaRegular(30)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .frame(width: scaleScreen_x(213), height: scaleScreen_y(235))
                .foregroundStyle(.white)
                .padding(.top)
                
        }.onTapGesture {
            vm.FailPurchases = false
        }
    }
}

#Preview {
    DefeatPurchases(vm: PlayerViewModel())
}
