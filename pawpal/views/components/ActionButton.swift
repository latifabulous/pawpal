//
//  DismissButton.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

struct ActionButton: View {
    let action: () -> Void
    var label: String = "Selanjutnya"
    var textColor: String = "neutral10"
    var buttonColor: String = "orange600"
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundColor(Color(textColor))
                .frame(width: 342, height: 56)
                .background(Color(buttonColor))
                .cornerRadius(20)  
        }
    }
}
