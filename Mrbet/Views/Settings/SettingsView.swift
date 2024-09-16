//
//  SettingsView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            //MARK: - BackGround View
            
            Image(.start)
                .resizable()
                .scaleEffect(x: 1.05, y: 1.05)
                .ignoresSafeArea()
            
            Image(.startPlayer)
                .resizable()
                .offset(x: 80, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SettingsView()
}
