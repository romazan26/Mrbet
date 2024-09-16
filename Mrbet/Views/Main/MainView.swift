//
//  MainView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - BackGround View
                
                    Image(.start)
                        .resizable()
                        .scaleEffect(x: 1.05, y: 1.05)
                    .ignoresSafeArea()
                
                    Image(.startPlayer)
                        .resizable()
                        .offset(x: 80, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        
                
                
                
                
                //MARK: - Group of button
                VStack {
                    //MARK: New game button
                    NavigationLink {
                        
                    } label: {
                        MenuButtonView(text: "New game", color: .yellowButton)
                    }
                    
                    //MARK: Continue button
                    NavigationLink {
                        
                    } label: {
                        MenuButtonView(text: "Continue", color: .pinkButton)
                    }
                    
                    //MARK: Settings button
                    NavigationLink {
                        
                    } label: {
                        MenuButtonView(text: "Settings", color: .bluebuton)
                    }
                    
                    //MARK: Exit button
                    NavigationLink {
                        
                    } label: {
                        MenuButtonView(text: "Exit", color: .greenButton)
                    }

                }
            }
        }
        
            
        
    }
}

#Preview {
    MainView()
}
