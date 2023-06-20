//
//  PawNameView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct PawNameView: View {
    @Binding var currentPage: Int
    @Binding var username: String
    @Binding var isUsernameEmpty: Bool
    
    var background: String
    
    var body: some View {
        ZStack {
            Image (background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Color("orange600").frame(height: 10 / UIScreen.main.scale)
                        .cornerRadius(20)
                    Color("orange400").frame(height: 10 / UIScreen.main.scale)
                        .cornerRadius(20)
                }
                
                Spacer()
                    .frame(height: 48)
                
                Text("Siapa nama kucingmu?")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Spacer ()
                    .frame(height: 20)
                
                TextField("Nama kucing", text: $username)
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("orange600"))
                    .onChange(of: username) { newValue in
                            isUsernameEmpty = newValue.isEmpty
                        }
           
                Spacer()
                
                Button(action: {
                    if isUsernameEmpty {
                            // Menampilkan peringatan jika nama kosong
                            // Atau melakukan tindakan lain sesuai kebutuhan
                    } else {
                        currentPage = 5
                    }
                }, label: {
                    Text("Selanjutnya")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                })
                .frame(maxWidth: 342, maxHeight: 56)
                .background(isUsernameEmpty ? Color("orange400") : Color ("orange600"))
                .cornerRadius(20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 70)
            .padding(.bottom, 58)
        }
    }
}
