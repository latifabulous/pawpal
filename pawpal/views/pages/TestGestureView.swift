//
//  TestGestureView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct TestGestureView: View {
    @State var isDragging = false
    @State var position = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(isDragging ? .gray : .white)
            
            Button(action: {
                // Aksi yang ingin dilakukan ketika tombol ditekan
            }) {
                Text("Button")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .offset(x: position.width, y: position.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.translation
                        isDragging = true
                    }
                    .onEnded { value in
                        position = .zero
                        isDragging = false
                    }
            )
        }
    }
}

struct TestGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TestGestureView()
    }
}
