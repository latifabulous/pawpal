//
//  LargeButton.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct ButtonActionView: View {
    let label: String
    let color: String
    let action: () -> Void
    var body: some View {
        Button( action:{
           action()
        }) {
                        
            Text(label)
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundColor(Color("neutral10"))
                .background(Color("\(color)")
                .cornerRadius(20)
                .frame(width: 310, height: 56)
            )
           
        }
    }
}
