//
//  HeaderView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct HeaderContainerView: View {
    @AppStorage("username") var username = ""
    @AppStorage("selectedAge") var selectedAge = ""
    
    private var ageCase: String {
        switch selectedAge {
        case "Kitten":
            return"kitten"
        case "Junior":
            return "junior"
        case "Adult":
            return "adult"
        case "Senior":
            return "senior"
        default:
            return "cat-profile"
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Button {
                
            } label: {
                Image (ageCase)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
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
