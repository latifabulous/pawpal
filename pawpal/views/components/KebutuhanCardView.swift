//
//  KebutuhanCardview.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct KebutuhanCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                HStack (alignment: .center) {
                    Circle()
                        .foregroundColor(Color("orange600"))
                        .frame(width: 16, height: 16)
                    Text("Kebutuhan")
                        .font(.callout)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("orange600"))
                }
            }.padding(.horizontal, 16)
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Kucingmu butuh perhatian dan kasih sayangmu.")
                    .font(.callout)
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral600"))
                Divider()
                    .background(Color("neutral200")) // Warna latar belakang
                    .frame(height: 1) // Tinggi garis
                    
                
                // pie chart
                CobaPieChartView()
                
            }
            .padding(.horizontal, 16)
            
            .padding(.bottom, 16)
        }
        
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("neutral10")))
        .padding(.horizontal, 24)
        .cornerRadius(20)
    }
}

