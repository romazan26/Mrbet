//
//  CustomSliderView.swift
//  Mrbet
//
//  Created by Роман on 17.09.2024.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var sliderValue: Float
    @State private var offset: CGFloat = 0
    var body: some View {

            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                ZStack{
                    Capsule()
                        .frame(width: 150, height: 16)
                        .foregroundColor(.black.opacity(0.6))
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    Capsule()
                        .frame(width: 143, height: 9)
                        .foregroundColor(.gray)
                    Capsule()
                        .frame(width: offset + 20, height: 9)
                        .foregroundColor(.bluApp)
                }
                }
                
                
                Image(.buttonSlider)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .offset(x: -7)
                    .offset(y: 7)
                    .offset(x: offset)
                    .gesture(DragGesture().onChanged({ value in
                        if value.location.x > 24 && value.location.x <= 150 {
                            offset = value.location.x - 24
                            sliderValue = Float(offset / 125)
                        }
                    }))
            }
        }
    
}

#Preview {
    CustomSliderView(sliderValue: .constant(0))
}
