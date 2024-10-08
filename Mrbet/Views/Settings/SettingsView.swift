//
//  SettingsView.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var vm = SettingsViewModel()
    @Environment(\.dismiss) var dismiss
    
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
            
            //MARK: - Main stack
            VStack{
                //MARK: - Close Button
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                        vm.save()
                        SoundManager.instance.playSound(sound: .tapButton)
                    } label: {
                        Image(.closeSetting)
                            .resizable()
                            .frame(width: scaleScreen_x(28), height: scaleScreen_x(28))
                    }
                }
                .padding()
                Spacer()
                //MARK: - Music slider
                SettingSlider(text: "Music", sliderVolue: $vm.musicSlider)
                
                //MARK: - Sound slider
                SettingSlider(text: "Sound", sliderVolue: $vm.soundsSlider)
                HStack{
                    
                    //MARK: - Policy button
                    Button(action: {
                        vm.isPresentPolicy.toggle()
                        SoundManager.instance.playSound(sound: .tapButton)
                    }, label: {
                        Image(.politicButton)
                            .resizable()
                            .frame(width: scaleScreen_x(44), height: scaleScreen_x(48))
                    })
                    
                    //MARK: - Share butoon
                    Button(action: {
                        vm.isPresentShare.toggle()
                        SoundManager.instance.playSound(sound: .tapButton)
                    }, label: {
                        Image(.shareButton)
                            .resizable()
                            .frame(width: scaleScreen_x(44), height: scaleScreen_x(48))
                    })
                    
                    //MARK: - Rate button
                    Button(action: {
                        SKStoreReviewController.requestReview()
                        SoundManager.instance.playSound(sound: .tapButton)
                    }, label: {
                        Image(.rateButton)
                            .resizable()
                            .frame(width: scaleScreen_x(44), height: scaleScreen_x(48))
                    })
                }
                
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
            .sheet(isPresented: $vm.isPresentShare, content: {
                ShareSheet(items: vm.urlShare)
            })
            .sheet(isPresented: $vm.isPresentPolicy, content: {
                WebViewPage(urlString: URL(string: "https://google.com")!)
            })
            .frame(width: scaleScreen_x(254), height: scaleScreen_y(372))
            .background {
                Image(.backTosetStack)
                    .resizable()
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
