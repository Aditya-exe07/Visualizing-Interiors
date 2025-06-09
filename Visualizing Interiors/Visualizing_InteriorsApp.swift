//
//  Visualizing_InteriorsApp.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

@main
struct Visualizing_InteriorsApp: App {
    let persistenceController = PersistenceController.shared  // Initialize Core Data

    var body: some Scene {
        WindowGroup {
            LogoView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)  // Pass Core Data context
        }
    }
}



