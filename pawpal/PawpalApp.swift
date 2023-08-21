//
//  pawpalApp.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 04/06/23.
//

import SwiftUI

@main
struct pawpalApp: App {
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var modelView = ModelView()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HasCompletedOnboarding()
                .preferredColorScheme(.light)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
