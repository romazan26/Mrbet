//
//  SettingSlider.swift
//  Mrbet
//
//  Created by Роман on 17.09.2024.
//

import SwiftUI

struct SettingSlider: View {
    var text: String
    @Binding var sliderVolue: Float
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .LondrinaRegular(32)
                .foregroundStyle(.white)
            CustomSliderView(sliderValue: $sliderVolue)
                .padding(.horizontal)
                
        }
    }
}

#Preview {
    SettingSlider(text: "Music", sliderVolue: .constant(0.5))
        .background {
            Color.black
        }
}
