//
//  CurrentProjectManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct CurrentProjectManager : BaseManagerProtocol{
    private let _currentProjectDataRepository = CurrentProjectDataRepository()
    
    func create(record: CurrentProject) {
        _currentProjectDataRepository.create(record: record)
    }
    
    func fetchALL() -> [CurrentProject]? {
        _currentProjectDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [CurrentProject]? {
        _currentProjectDataRepository.get(byName: name)
    }
    
    func updateRecord(record: CurrentProject) -> Bool {
        _currentProjectDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _currentProjectDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDCurrentProject]
    {
        _currentProjectDataRepository.getALLRecords()!
    }
    typealias T = CurrentProject
    
}
