//
//  HeaderView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct HeaderView: View {
    @AppStorage("username") var username = ""
    @AppStorage("selectedAge") var selectedAge = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                
            } label: {
                // Menggunakan kondisi untuk menentukan gambar yang ditampilkan
                if selectedAge == "Kitten" {
                    Image("kitten")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                } else if selectedAge == "Junior" {
                    Image("junior")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                } else if selectedAge == "Dewasa" {
                    Image("dewasa")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                } else if selectedAge == "Senior" {
                    Image("senior")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                } else {
                    Image("cat-profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Halo")
                    .foregroundColor(Color("neutral400"))
                    .font(.callout)
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                Text("\(username) ^-^")
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("neutral800"))
            }
            .hLeading()
        }
        .padding(24)
        .padding(.top)
    }
}
