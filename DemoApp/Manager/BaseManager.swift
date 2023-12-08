//
//  BaseManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 07/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

protocol BaseManagerProtocol {
    associatedtype T
    
    func create(record : T)
    func fetchALL() -> [T]?
    func fetchRecord(byName name : String) -> [T]?
    func updateRecord(record : T) ->Bool
    func deleteRecord(byName name : String) ->Bool
    
}

