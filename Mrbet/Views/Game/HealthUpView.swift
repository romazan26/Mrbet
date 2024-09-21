//
//  HealthUpView.swift
//  Mrbet
//
//  Created by Роман on 18.09.2024.
//

import SwiftUI

struct HealthUpView: View {
    @StateObject var vm: PlayerViewModel
    var body: some View {
       
        VStack{
            //MARK: - Top bar
            Topbar(text: "Health")
            .padding()
            //MARK: - Health up list
            ScrollView {
                ForEach(Health.allCases ,id: \.id) { hlth in
                    PurchasesCellView( image: hlth.image,
                                       price: hlth.price,
                                      text: hlth.text)
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
    HealthUpView(vm: PlayerViewModel())
}
