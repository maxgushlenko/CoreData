//
//  ViewController.swift
//  Databases
//
//  Created by Maksym on 06/12/2024.
//

import UIKit

class ViewController: UIViewController {
    let dataService = CoreDataService(context: CoreDataStack.shared.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.coredataFilePath)
        
        //        create()
        let user = read(by: -1)
        print("end")
    }
    
    fileprivate func create() {
        do {
            try dataService.create(User.self) { user in
                user.id = Int64(Int.random(in: 0...Int.max))
                user.name = "Maksym"
            }
        } catch (let error) {
            print(error)
        }
    }
    
    fileprivate func read(by id: Int64) -> User? {
        do {
            guard let user = try dataService.read(UserFetchRequestsFactory.with(id: id)).first
            else { return nil }
            return user
        } catch (let error) {
            print(error)
            return nil
        }
    }
}

import CoreData

struct UserFetchRequestsFactory {
    static func with(id: Int64) -> NSFetchRequest<User> {
        User.fetchRequest().with(predicate: .init(format: "id == %lld", id))
    }
}



