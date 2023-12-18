//
//  Interest_HobbiesManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct Interest_HobbiesManager : BaseManagerProtocol{
    private let _interest_HobbiesDataRepository = Interest_HobbiesDataRepository()
    func create(record: Interest_Hobbies) {
        _interest_HobbiesDataRepository.create(record: record)
    }
    
    func fetchALL() -> [Interest_Hobbies]? {
        _interest_HobbiesDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [Interest_Hobbies]? {
        _interest_HobbiesDataRepository.get(byName: name)
    }
    
    func updateRecord(record: Interest_Hobbies) -> Bool {
        _interest_HobbiesDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _interest_HobbiesDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDInterestNHobbies]
    {
        _interest_HobbiesDataRepository.getALLRecords()!
    }
    
    typealias T = Interest_Hobbies
}
