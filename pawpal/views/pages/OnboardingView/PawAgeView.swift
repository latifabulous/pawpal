//
//  PawAgeView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct AgeOptionView: View {
    var option: String
    var isSelected: Bool
    var action: () -> Void
    var rangeAge: String
    
    var body: some View {
        Button(action: action) {
            Circle()
                .stroke(isSelected ? Color("orange600") : Color("orange400"), lineWidth: isSelected ? 3 : 1)
                .frame(width: 163, height: 163)
                .overlay(
                    VStack {
                        Text(option)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        
                        Text(rangeAge)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                    }
                )
        }
    }
}

// pindahin di file lain
struct PawAgeView: View {
    
    @Binding var currentSteps: Int
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
                    AgeOptionView(option: "Kitten", isSelected: selectedAge == "Kitten", action: {selectedAge = "Kitten"}, rangeAge: "0 - 6 bulan")
                    
                    Spacer()
                        .frame(width: 16)
                    
                    AgeOptionView(option: "Junior", isSelected: selectedAge == "Junior", action: {selectedAge = "Junior"}, rangeAge: "6 bulan - 3 tahun")
                }
                
                Spacer()
                    .frame(height: 16)
                
                HStack {
                    AgeOptionView(option: "Dewasa", isSelected: selectedAge == "Dewasa", action: {selectedAge = "Dewasa"}, rangeAge: "3 - 10 tahun")
                    
                    Spacer()
                        .frame(width: 16)
                    
                    AgeOptionView(option: "Senior", isSelected: selectedAge == "Senior", action: {selectedAge = "Senior"}, rangeAge: "10+ tahun")
                }
                
                Spacer ()
                
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                    currentSteps = 1
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
