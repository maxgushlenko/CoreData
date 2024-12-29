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
