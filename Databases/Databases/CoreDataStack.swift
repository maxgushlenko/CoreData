//
//  CoreDataStack.swift
//  Databases
//
//  Created by Maksym on 06/12/2024.
//

import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Databases")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
        
    func save() {
        try? viewContext.save()
    }
    
    func backgroundContext(name: String? = nil, parent: NSManagedObjectContext? = nil) -> NSManagedObjectContext {
        var context: NSManagedObjectContext
        
        if parent == nil {
            context = persistentContainer.newBackgroundContext()
        } else {
            context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            context.parent = parent
        }
        context.name = name
        return context
    }
}
