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
        
        do {
            try dataService.create(User.self) { user in
                user.id = Int64(Int.random(in: 0...Int.max))
                user.name = "Maksym"
            }
        } catch (let error) {
            print(error)
        }
    }
}

