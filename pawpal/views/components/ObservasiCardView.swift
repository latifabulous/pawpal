//
//  ObservasiCardView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct ObservasiCardView: View {
    @AppStorage("username") var username = ""
    
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var modelView = ModelView()
    
    var body: some View {
        VStack {
            Image("banner")
                .resizable()
                .frame(width: 342, height: 136)
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
            VStack (alignment: .leading, spacing: 8){
                Text("Bagaimana perilaku \(username) saat ini?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral800"))
                
                Text("Jangan ada misinterpretasi diantara kita.")
                    .font(.body)
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral400"))
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
                
            NavigationLink(destination:
//                            Save()
//                                .environmentObject(modelView)
//                                .environmentObject(logModel)
                           PawCamView()
            ) {

                Text("Mulai Observasi")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral10"))
                    .background(Color("orange600")
                    .cornerRadius(20)
                    .frame(width: 310, height: 56)
                    
                )
                
            }
            

        }
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("neutral10")))
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
}

