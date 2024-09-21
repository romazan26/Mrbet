//
//  Topbar.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct Topbar: View {
    @Environment(\.dismiss) var dismiss
    var text: String
    var body: some View {
        HStack{
            Button(action: {
                dismiss()
            }, label: {
                Image(.backButton)
                    .resizable()
                    .frame(width: scaleScreen_x(52), height: scaleScreen_x(52))
            })
            Spacer()
            ZStack{
                Image(.backLabelView)
                    .resizable()
                    .frame(width: scaleScreen_x(270), height: scaleScreen_y(52))
                Text(text)
                    .LondrinaRegular(32)
                    .foregroundStyle(.colortext)
            }
        }
    }
}

//#Preview {
//    Topbar(text: "Purchases", action: ())
//}
