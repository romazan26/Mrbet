//
//  PurchasesView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct PurchasesView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
       
            VStack{
                //MARK: - Top bar
                Topbar(text: "Purchases")
                .padding()
                //MARK: - Purchases
                ScrollView {
                    ForEach(Purchases.allCases ,id: \.id) { purchas in
                        PurchasesCellView(image: purchas.image,
                                          price: purchas.price,
                                          text: purchas.text)
                    }
                }.padding()
            }
            .background(content: {
                Image(.purchases)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            })
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    PurchasesView(vm: PlayerViewModel())
}
