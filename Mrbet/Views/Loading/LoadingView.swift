//
//  ContentView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isPresent = false
    @State private var dotIndex = 0
      private let loadingText = "Loading"
      private let maxDots = 3
    
    var body: some View {
        VStack(spacing: 30) {
            //MARK: - Logo
            Image(.logo)
                .resizable()
                .frame(width: 240, height: 248)
            //MARK: - Loading text
            Text("\(loadingText)\(String(repeating: ".", count: dotIndex))\(String(repeating: " ", count: maxDots - dotIndex))")
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .heavy, design: .monospaced))
                .padding()
                
                .frame(width: 250, alignment: .center)
                
                
        }
        .onAppear {startLoadingAnimation()}
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(.back)
                .resizable()
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            MainView()
        })
    }
    //MARK - Function timer loading
    private func startLoadingAnimation() {
        var percents = 0
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                dotIndex = (dotIndex + 1) % (maxDots + 1)
            
                if percents < 10{
                    percents += 1
                }else {
                    timer.invalidate()
                    isPresent.toggle()
                }
            }
        }
}

#Preview {
    LoadingView()
}
