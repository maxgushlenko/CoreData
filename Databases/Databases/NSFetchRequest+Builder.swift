//
//  NSFetchRequest+Builder.swift
//  Databases
//
//  Created by Maksym on 27/12/2024.
//

import CoreData

@objc
extension NSFetchRequest {
    func with(predicate: NSPredicate) -> NSFetchRequest {
        self.predicate = predicate
        return self
    }
    
    func with(sortDescriptor: NSSortDescriptor) -> NSFetchRequest {
        self.sortDescriptors = [sortDescriptor]
        return self
    }
}
