//
//  DragGestureCobaView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import Foundation
import SwiftUI

struct CircleButton: View {
    @State private var pupilDragAmount: CGPoint?
    @State private var ekorDragAmount: CGPoint?
    
    var body: some View {
        VStack {
            GeometryReader { gp in // inisialisasi posisi di tengah
                ZStack {
                    Button(action: self.performAction) {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 5)
                            
                            Text("Pupil")
                                .foregroundColor(.white)
                                
                        }
                        
                    }
            
                    .animation(.default, value: pupilDragAmount)
                    .position(self.pupilDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged { self.pupilDragAmount = $0.location})
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
            }
            
            GeometryReader { gp in // inisialisasi posisi di tengah
                ZStack {
                    Button(action: self.performAction) {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 5)
                            
                            Text("Ekor")
                                .foregroundColor(.white)
                                
                        }
                        
                    }
            
                    .animation(.default, value: ekorDragAmount)
                    .position(self.ekorDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged { self.ekorDragAmount = $0.location})
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
            }
        }

    }

    func performAction() {
        print("button pressed")
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
