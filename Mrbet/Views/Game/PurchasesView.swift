//
//  PurchasesView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct PurchasesView: View {
    @StateObject var vm: PlayerViewModel
    let player: Player
    var body: some View {
       
        ZStack {
            VStack{
                //MARK: - Top bar
                Topbar(text: "Purchases")
                    .padding()
                //MARK: - Purchases
                ScrollView {
                    ForEach(Purchases.allCases ,id: \.id) { purchas in
                        Button {
                            vm.buyPurcheses(player: player, purchases: purchas)
                        } label: {
                            PurchasesCellView(player: player, purchases: purchas)
                        }
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
            
            if vm.SuccessPurchases {
                SuccessPurchases(vm: vm)
            }
            if vm.FailPurchases {
                DefeatPurchases(vm: vm)
            }
            if vm.healthAlert {
                HealthAlert(vm: vm)
            }
                
        }
    }
}

#Preview {
    PurchasesView(vm: PlayerViewModel(), player: Player())
}
