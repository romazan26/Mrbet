//
//  MoneyView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct MoneyView: View {
    var money: Int64
    var body: some View {
        ZStack {
            Image(.backToMoney)
                .resizable()
                .frame(width: scaleScreen_x(188), height: scaleScreen_y(44))
            Text("$ \(money)")
                .LondrinaRegular(32)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    MoneyView(money: 1250)
}
