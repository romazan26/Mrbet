//
//  HealthView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct HealthView: View {
    var health: Int16
    var body: some View {
        ZStack {
            HStack(spacing: -10) {
                Image(.backToHealth)
                    .resizable()
                .frame(width: scaleScreen_x(150), height: 44)
                Image(.plusHealth)
                    .resizable()
                .frame(width: scaleScreen_x(44), height: 44)
            }
            Text("\(health)%")
                .LondrinaRegular(32)
                .foregroundStyle(.white)
                .padding(.trailing, 30)
        }
    }
}

#Preview {
    HealthView(health: 99)
}
