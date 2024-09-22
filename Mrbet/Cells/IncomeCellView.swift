//
//  PurchasesCellView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct IncomeCellView: View {
    var isIncome = false
    var image: ImageResource
    var price: Int64
    var text: String
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Image(.backToCell)
                .resizable()
            HStack(spacing: 15) {
                //MARK: - Image player
                Image(image)
                    .resizable()
                    .frame(width: scaleScreen_x(100), height: scaleScreen_x(100))
                
                VStack(alignment: .leading) {
                    Text(text)
                        .LondrinaRegular(scaleScreen_x(20))
                    //MARK: - Monet player
                    Text(isIncome ? "$ 0-\(price)" : "$ \(price)")
                        .LondrinaRegular(scaleScreen_x(32))
                        .minimumScaleFactor(0.5)
                }.foregroundStyle(.white)
                Spacer()
                
               // switch
                    Image(.rigrhtButton)
                        .resizable()
                        .frame(width: scaleScreen_x(52), height: scaleScreen_x(52))
                        .padding(.trailing)
                
            }
        }.frame(height: scaleScreen_x(100))
    }
}

#Preview {
    IncomeCellView(image: .cofe, price: 1000000, text: "Buy a slot machine")
}
