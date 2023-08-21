//
//  IndikatorButtonComponent.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI

//change color when button is selected
struct PopoverButtonStyle: ButtonStyle {
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isActive ? Color.blue : Color.clear)
            .foregroundColor(isActive ? .white : .black)
            .cornerRadius(5)
    }
}

//dismiss button in popover
struct DismissButton: View {
    @Binding var isPopoverVisible: Bool
    
    var body: some View {
        ActionButton(action: {isPopoverVisible = false})
    }
}

//define which indicator should be shown in popover
struct IndikatorPopOver: View {
    var modelOpsi : OpsiPerIndikator
    var currentIndex : Int
    var action: (String) -> Void
    
    @State private var selectedPilihan: String = ""
    
    var body: some View {
        VStack {
            ForEach(opsiIndikatorLists[currentIndex].allOptions, id: \.self) { option in
                Button(action: {
                    selectedPilihan = option
                    action(option)
                }) {
                    Text(option)
                }
                .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == option))
            }
        }
    }
}

//enable drag and popover for indicators
struct IndikatorView<Content: View>: View {
    let imageName: String
    let popoverContent: Content
    
    @Binding var isPopoverVisible: Bool
    @Binding var dragAmount: CGPoint?
    
    var body: some View {
        GeometryReader { gp in // inisialisasi posisi di tengah
            ZStack {
                Button(action: {
                    isPopoverVisible = true
                }) {
                    Image(imageName)
                        .frame(width: 56, height: 56)
                        .background(
                            Circle()
                                .fill(Color("orange200"))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 99)
                                .stroke(Color("orange200"), lineWidth: 15)
                                .opacity(0.1)
                        )
                }
                .popover(isPresented: $isPopoverVisible, arrowEdge: .top) {
                    VStack {
                        popoverContent
                        DismissButton(isPopoverVisible: $isPopoverVisible)
                    }
                    
                }
                .animation(.default, value: dragAmount)
                .position(dragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                .highPriorityGesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.location })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
