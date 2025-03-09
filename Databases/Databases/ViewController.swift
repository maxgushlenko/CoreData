//
//  ViewController.swift
//  Databases
//
//  Created by Maksym on 06/12/2024.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    let dataService = CoreDataService(context: CoreDataStack.shared.viewContext)
    let testContexts = TestContexts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.coredataFilePath)
    }
}

final class TestContexts {
    private let viewContext = CoreDataStack.shared.viewContext
    private lazy var backgroundContextA = CoreDataStack.shared.backgroundContext(name: "Background A", parent: viewContext)
    private lazy var backgroundContextB = CoreDataStack.shared.backgroundContext(name: "Background B")
    
    init() {
        reset()
        subscribeToContextChanges()
        createUsers(in: backgroundContextA, save: true) {
            let users = self.fetchAllUsers(in: self.viewContext)
            try? self.viewContext.save()
            self.viewContext.printObjects()
            msgPrint("")
        }
    }
    
    func reset() {
        CoreDataStack.shared.resetPersistentContainer()
    }
    
    func fetchAllUsers(in context: NSManagedObjectContext) -> [User] {
        return (try? context.fetch(User.fetchRequest())) ?? []
    }
    
    func subscribeToContextChanges() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didSaveContextA),
                                               name: .NSManagedObjectContextDidSave,
                                               object: backgroundContextA)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didChangeContextView),
                                               name: .NSManagedObjectContextObjectsDidChange,
                                               object: viewContext)
    }
    
    @objc
    func didSaveContextA(_ notification: Notification) {
        msgPrint("Context A did save")
        backgroundContextA.printObjects()
    }
    
    @objc
    func didChangeContextView() {
        msgPrint("Context View did change")
        viewContext.printObjects()
    }
    
    func createUsers(in context: NSManagedObjectContext, save: Bool = false, completion: (() -> Void)? = nil) {
        weak var weakContext = context
        context.perform {
            guard let weakContext else { return }
            for i in 0...10 {
                let user = User(context: weakContext)
                user.id = Int64(i)
                user.name = "User \(i)"
            }
        } completion: {
            msgPrint("Users created")
            if save {
                try? weakContext?.save()
            }
            completion?()
        }
    }
}
