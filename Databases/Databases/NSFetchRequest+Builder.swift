//
//  NSFetchRequest+Builder.swift
//  Databases
//
//  Created by Maksym on 27/12/2024.
//

import CoreData

/// Contains methods for building `NSFetchRequest`.
@objc
extension NSFetchRequest {
    /// Sets value to `NSFetchRequest.entity` property.
    func entity(_ entity: NSEntityDescription) -> NSFetchRequest {
        self.entity = entity
        return self
    }
    
    /// Sets value to `NSFetchRequest.predicate` property.
    func predicate(_ predicate: NSPredicate) -> NSFetchRequest {
        self.predicate = predicate
        return self
    }
    
    /// Sets value to `NSFetchRequest.sortDescriptors` property.
    func sortDescriptors(_ sortDescriptors: [NSSortDescriptor]) -> NSFetchRequest {
        self.sortDescriptors = sortDescriptors
        return self
    }
    
    /// Sets value to `NSFetchRequest.fetchLimit` property.
    func fetchLimit(_ fetchLimit: Int) -> NSFetchRequest {
        self.fetchLimit = fetchLimit
        return self
    }
    
    /// Sets value to `NSFetchRequest.affectedStores` property.
    func affectedStores(_ affectedStores: [NSPersistentStore]) -> NSFetchRequest {
        self.affectedStores = affectedStores
        return self
    }
    
    /// Sets value to `NSFetchRequest.resultType` property.
    func resultType(_ resultType: NSFetchRequestResultType) -> NSFetchRequest {
        self.resultType = resultType
        return self
    }
    
    /// Sets value to `NSFetchRequest.includesSubentities` property.
    func includesSubentities(_ includesSubentities: Bool) -> NSFetchRequest {
        self.includesSubentities = includesSubentities
        return self
    }
    
    /// Sets value to `NSFetchRequest.includesPropertyValues` property.
    func includesPropertyValues(_ includesPropertyValues: Bool) -> NSFetchRequest {
        self.includesPropertyValues = includesPropertyValues
        return self
    }
    
    /// Sets value to `NSFetchRequest.returnsObjectsAsFaults` property.
    func returnsObjectsAsFaults(_ returnsObjectsAsFaults: Bool) -> NSFetchRequest {
        self.returnsObjectsAsFaults = returnsObjectsAsFaults
        return self
    }
    
    /// Sets value to `NSFetchRequest.relationshipKeyPathsForPrefetching` property.
    func relationshipKeyPathsForPrefetching(_ relationshipKeyPathsForPrefetching: [String]) -> NSFetchRequest {
        self.relationshipKeyPathsForPrefetching = relationshipKeyPathsForPrefetching
        return self
    }
    
    /// Sets value to `NSFetchRequest.includesPendingChanges` property.
    func includesPendingChanges(_ includesPendingChanges: Bool) -> NSFetchRequest {
        self.includesPendingChanges = includesPendingChanges
        return self
    }
    
    /// Sets value to `NSFetchRequest.returnsDistinctResults` property.
    func returnsDistinctResults(_ returnsDistinctResults: Bool) -> NSFetchRequest {
        self.returnsDistinctResults = returnsDistinctResults
        return self
    }
    
    /// Sets value to `NSFetchRequest.propertiesToFetch` property.
    func propertiesToFetch(_ propertiesToFetch: [Any]) -> NSFetchRequest {
        self.propertiesToFetch = propertiesToFetch
        return self
    }
    
    /// Sets value to `NSFetchRequest.fetchOffset` property.
    func fetchOffset(_ fetchOffset: Int) -> NSFetchRequest {
        self.fetchOffset = fetchOffset
        return self
    }
    
    /// Sets value to `NSFetchRequest.fetchBatchSize` property.
    func fetchBatchSize(_ fetchBatchSize: Int) -> NSFetchRequest {
        self.fetchBatchSize = fetchBatchSize
        return self
    }
    
    /// Sets value to `NSFetchRequest.shouldRefreshRefetchedObjects` property.
    func shouldRefreshRefetchedObjects(_ shouldRefreshRefetchedObjects: Bool) -> NSFetchRequest {
        self.shouldRefreshRefetchedObjects = shouldRefreshRefetchedObjects
        return self
    }
    
    /// Sets value to `NSFetchRequest.propertiesToGroupBy` property.
    func propertiesToGroupBy(_ propertiesToGroupBy: [Any]) -> NSFetchRequest {
        self.propertiesToGroupBy = propertiesToGroupBy
        return self
    }
    
    /// Sets value to `NSFetchRequest.havingPredicate` property.
    func havingPredicate(_ havingPredicate: NSPredicate) -> NSFetchRequest {
        self.havingPredicate = havingPredicate
        return self
    }
}
