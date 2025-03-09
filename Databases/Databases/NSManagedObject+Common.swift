//
//  NSManagedObject+Common.swift
//  Databases
//
//  Created by Maksym on 27/12/2024.
//

import CoreData

extension NSManagedObject {
    static var entityName: String { return String(describing: self) }
    
    static func fetchRequest<T: NSManagedObject>(_ entity: T.Type) -> NSFetchRequest<T> {
        NSFetchRequest<T>(entityName: entity.entityName)
    }
}


extension NSManagedObjectContext {
    func printObjects() {
        msgPrint("Description of \(self.name ?? "Unknown") (hasChanges: \(hasChanges))")
        msgPrint("inserted: \(insertedObjects.count), updated: \(updatedObjects.count), deleted: \(deletedObjects.count) registered: \(registeredObjects.count) \n")
    }
    
    func perform(_ block: @escaping () -> Void, completion: @escaping () -> Void) {
        perform {
            block()
            completion()
        }
    }
}

extension CoreDataStack {
    func resetPersistentContainer() {
        let coordinator = CoreDataStack.shared.persistentContainer.persistentStoreCoordinator
        let storeURL = coordinator.persistentStores.first?.url
        
        guard let storeURL = storeURL else {
            print("Persistent store URL not found")
            return
        }
        
        let storeType = NSSQLiteStoreType
        
        do {
            try coordinator.destroyPersistentStore(at: storeURL, ofType: storeType)
            try coordinator.addPersistentStore(ofType: storeType, configurationName: nil, at: storeURL, options: nil)
            print("Persistent store reset successfully")
        } catch {
            print("Failed to reset persistent store: \(error)")
        }
    }
}

func msgPrint(_ message: String) {
    print("msg___ \(message)")
}
