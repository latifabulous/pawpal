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
            Text("Save")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
