//
//  DismissButton.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

struct DismissButton: View {
    @Binding var isPopoverVisible: Bool
    
    var body: some View {
        Button(action: {
            isPopoverVisible = false
        }) {
            Text("Selanjutnya")
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
}
