//
//  IndikatorButtonComponent.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
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

struct Pilihan: View {
    var pilihan1: String = " "
    var pilihan2: String = " "
    var pilihan3: String = " "
    var pilihan4: String = " "
    var pilihan5: String = " "
    var pilihan6: String = " "
    var pilihan7: String = " "
    var pilihan8: String = " "
    var action: (String) -> Void

    @State private var selectedPilihan: String = ""

    var body: some View {
        VStack {
            
            Button(action: {
                selectedPilihan = pilihan1
                action(pilihan1)
            }) {
                Text(pilihan1)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan1))
            
            Button(action: {
                selectedPilihan = pilihan2
                action(pilihan2)
            }) {
                Text(pilihan2)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan2))
            
            Button(action: {
                selectedPilihan = pilihan3
                action(pilihan3)
            }) {
                Text(pilihan3)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan3))
            
            Button(action: {
                selectedPilihan = pilihan4
                action(pilihan4)
            }) {
                Text(pilihan4)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan4))
            
            Button(action: {
                selectedPilihan = pilihan5
                action(pilihan5)
            }) {
                Text(pilihan5)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan5))
            
            Button(action: {
                selectedPilihan = pilihan6
                action(pilihan6)
            }) {
                Text(pilihan6)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan6))
            
            Button(action: {
                selectedPilihan = pilihan7
                action(pilihan7)
            }) {
                Text(pilihan7)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan7))
            
            Button(action: {
                selectedPilihan = pilihan8
                action(pilihan8)
            }) {
                Text(pilihan8)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan8))

        }
    }
}
