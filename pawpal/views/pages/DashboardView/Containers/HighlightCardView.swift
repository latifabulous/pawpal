//
//  HighlightCardView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct HighlightContainerView: View {
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Highlight")
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .foregroundColor(Color("neutral800"))
                .padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center) {
                    HStack (alignment: .center) {
                        Circle()
                            .foregroundColor(Color("pink800"))
                            .frame(width: 16, height: 16)
                        Text("Observasi")
                            .font(.callout)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("green800"))
                    }
                }.padding(.horizontal, 16)
                    .padding(.top, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ternyata Koyumi memiliki 5 kebiasaan menarik yang patut untuk diamati hari ini.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral600"))
                    Divider()
                        .background(Color("neutral200")) // Warna latar belakang
                        .frame(height: 1) // Tinggi garis
                    
                    
                    // week view
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 12){
                            
                            ForEach(logModel.currentWeek, id: \.self) {
                                day in
                                
                                VStack(spacing: 12) {
                                    // EEE = sen sel
                                    Text(logModel.extractDate(date: day, format: "EEE"))
                                        .font(.footnote)
                                        .fontWeight(.medium)
                                        .fontDesign(.rounded)
                                        .foregroundColor(Color("neutral400"))
                                    Text(logModel.extractDate(date: day, format: "dd"))
                                        .font(.callout)
                                        .fontDesign(.rounded)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral10"))
                                        .frame(width: 32, height: 32)
                                        .background(
                                            ZStack{
                                                Capsule()
                                                    .fill(Color("green800"))
                                            }
                                        )
                                    
                                }
                            }
                            
                        }
                        .padding(.horizontal, 24)
                        
                    }
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
}
