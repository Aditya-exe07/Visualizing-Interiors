//
//  Persistence.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "VisualizingInteriors") // Match Core Data model name
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
}

