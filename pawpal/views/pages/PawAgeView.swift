//
//  PawAgeView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct PawAgeView: View {
    
    @Binding var currentPage: Int
    @Binding var username: String
    @AppStorage("selectedAge") var selectedAge: String = ""
    
    var background: String
    
    var body: some View {
        ZStack {
            Image (background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Color("orange400").frame(height: 10 / UIScreen.main.scale)
                        .cornerRadius(20)
                    Color("orange600").frame(height: 10 / UIScreen.main.scale)
                        .cornerRadius(20)
                }
                
                Spacer()
                    .frame(height: 48)
                
                Text("Berapa umur \(username)?")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer ()
                
                HStack {
                    OptionView(option: "Kitten", isSelected: selectedAge == "Kitten", action: {selectedAge = "Kitten"}, rangeAge: "0 - 6 bulan")
                    
                    Spacer()
                        .frame(width: 16)
                    
                    OptionView(option: "Junior", isSelected: selectedAge == "Junior", action: {selectedAge = "Junior"}, rangeAge: "6 bulan - 3 tahun")
                }
                
                Spacer()
                    .frame(height: 16)
                
                HStack {
                    OptionView(option: "Dewasa", isSelected: selectedAge == "Dewasa", action: {selectedAge = "Dewasa"}, rangeAge: "3 - 10 tahun")
                    
                    Spacer()
                        .frame(width: 16)
                    
                    OptionView(option: "Senior", isSelected: selectedAge == "Senior", action: {selectedAge = "Senior"}, rangeAge: "10+ tahun")
                }
                
                Spacer ()
                
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                    currentPage = 1
                }, label: {
                    Text("Simpan")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                })
                .frame(maxWidth: 342, maxHeight: 56)
                .background(Color("orange600"))
                .cornerRadius(20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 70)
            .padding(.bottom, 58)
        }
    }
}

