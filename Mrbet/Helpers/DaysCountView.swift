//
//  DaysCountView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct DaysCountView: View {
    var days: String
    var body: some View {
        ZStack {
            Image(.backToDays)
                .resizable()
            VStack {
                Text(days)
                    .LondrinaRegular(32)
                Text("days")
                    .LondrinaRegular(24)
                    
            }.foregroundStyle(.white)
        }
        .frame(width: scaleScreen_x(141), height: scaleScreen_y(92))
    }
}

#Preview {
    DaysCountView(days: "15")
}
