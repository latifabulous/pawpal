//
//  ObservasiCardView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct ObservasiContainerView: View {
    @AppStorage("username") var username = ""
    
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var modelView = ModelView()
    
    var body: some View {
        VStack {
            Image("banner")
                .resizable()
                .frame(width: 342, height: 136)
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedContainer(radius: 20, corners: [.topLeft, .topRight]))
            
            Title2Text(text: "Bagaimana perilaku \(username) saat ini?")
                .fontWeight(.bold)
            
            BodyText(text: "Jangan ada misinterpretasi diantara kita.")
                .padding(.bottom, 32)
            
            NavigationLink(destination:PawCamView()) {
                Text("Mulai Observasi")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral10"))
                    .frame(width: 342, height: 56)
                    .background(Color("orange600"))
                    .cornerRadius(20)
            }
            
        }
        .background(RoundedRectangle(cornerRadius: 20)
        .foregroundColor(Color("neutral10")))
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
}

