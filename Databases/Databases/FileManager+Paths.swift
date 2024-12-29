//
//  FileManager+Paths.swift
//  Databases
//
//  Created by Maksym on 16/12/2024.
//

import Foundation

extension FileManager {
    var coredataFilePath: URL {
        URL(fileURLWithPath: libraryDirectory.absoluteString).appendingPathComponent("Databases")
    }
    
    var documentsDirectory: URL {
        URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true
        ).first!)
    }
    
    var libraryDirectory: URL {
        URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(
            .libraryDirectory,
            .userDomainMask,
            true
        ).first!)
    }
}
