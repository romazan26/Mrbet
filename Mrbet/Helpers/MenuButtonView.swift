//
//  MenuButton.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct MenuButtonView: View {
    var text: String
    var color: ImageResource
    var body: some View {
        ZStack {
            //MARK: - BackGround buttom
            Image(color)
                .resizable()
            
            //MARK: - Text buttom
            Text(text)
                .LondrinaRegular(32)
                .padding(.bottom, 8)
        }
        .frame(width: scaleScreen_x(200), height: scaleScreen_y(60))
    }
}

#Preview {
    MenuButtonView(text: "New game", color: .yellowButton)
}


