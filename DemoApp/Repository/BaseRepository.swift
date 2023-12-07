//
//  BaseRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

protocol BaseRepository {
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]?
    func get(byName name : String) -> [T]?
    func update(record: T) ->Bool
    func delete(byName name : String) -> Bool
}
