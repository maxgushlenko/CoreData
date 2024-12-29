//
//  CoreDataService.swift
//  Databases
//
//  Created by Maksym on 27/12/2024.
//

import CoreData

enum DataBaseError: Error {
    case creatingFailed
    case updatingFailed
    case deletingFailed
    case error(Error)
}

protocol CoreDataCRUDable {
    func create<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void) throws
    func read<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) throws -> [T]
    func update<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>, updates: (T) -> Void) throws
    func delete<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) throws
}

final class CoreDataService: CoreDataCRUDable {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }

    // MARK: - Create
    func create<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void) throws {
        let entity = NSEntityDescription.insertNewObject(forEntityName: type.entityName, into: context) as? T
        guard let entity else { throw DataBaseError.creatingFailed }
        configure(entity)
        try saveContext()
    }

    // MARK: - Read
    func read<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) throws -> [T] {
        do { return try context.fetch(fetchRequest) }
        catch (let error) { throw DataBaseError.error(error) }
    }

    // MARK: - Update
    func update<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>, updates: (T) -> Void) throws {
        do {
            guard let object = try context.fetch(fetchRequest).first else { return }
            updates(object)
            try saveContext()
        } catch (let error) { throw DataBaseError.error(error) }
    }

    // MARK: - Delete
    func delete<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) throws {
        do {
            guard let object = try context.fetch(fetchRequest).first else { return }
            context.delete(object)
            try saveContext()
        } catch { throw DataBaseError.error(error) }
    }

    // MARK: - Private methods
    private func saveContext() throws {
        guard context.hasChanges else { return }
        try context.save()
    }
}
