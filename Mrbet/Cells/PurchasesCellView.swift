//
//  PurchasesCellView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct PurchasesCellView: View {

    @ObservedObject var player: Player
    let purchases: Purchases
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Image(.backToCell)
                .resizable()
            HStack(spacing: 15) {
                //MARK: - Image player
                Image(purchases.image)
                    .resizable()
                    .frame(width: scaleScreen_x(100), height: scaleScreen_x(100))
                
                VStack(alignment: .leading) {
                    Text(purchases.text)
                        .LondrinaRegular(scaleScreen_x(20))
                    //MARK: - Monet player
                    Text("$ \(purchases.price)")
                        .LondrinaRegular(scaleScreen_x(32))
                        .minimumScaleFactor(0.5)
                }.foregroundStyle(.white)
                Spacer()
                if player.level < purchases.level {
                    Image(.rigrhtButton)
                        .resizable()
                        .frame(width: scaleScreen_x(52), height: scaleScreen_x(52))
                        .padding(.trailing)
                }
                    
                
            }
        }.frame(height: scaleScreen_x(100))
    }
}

#Preview {
    PurchasesCellView(player: Player(), purchases: Purchases.buyAcasino)
}
