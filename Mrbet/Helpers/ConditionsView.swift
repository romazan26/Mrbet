//
//  ConditionsView.swift
//  Mrbet
//
//  Created by Роман on 21.09.2024.
//

import SwiftUI

struct ConditionsView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            Image(.condition)
                .resizable()
                .frame(width: scaleScreen_x(253), height: scaleScreen_y(352))
            VStack {
                Text("\(vm.conditionsText)")
                    .LondrinaRegular(32)
                    .multilineTextAlignment(.center)
                
            }
            .frame(width: scaleScreen_x(253), height: scaleScreen_y(352))
            .foregroundStyle(.white)
        }.onTapGesture {
            vm.conditions = false
        }
    }
}

#Preview {
    ConditionsView(vm: PlayerViewModel())
}
