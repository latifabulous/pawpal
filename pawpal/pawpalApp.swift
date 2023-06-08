//
//  pawpalApp.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 04/06/23.
//

import SwiftUI

@main
struct pawpalApp: App {
    @StateObject var modelView = ModelView()
    
    var body: some Scene {
        WindowGroup {
            FinalView()
                .environmentObject(modelView)
        }
    }
}
