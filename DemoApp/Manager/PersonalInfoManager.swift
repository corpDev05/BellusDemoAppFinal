//
//  PersonalInfoManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct PersonalInfoManager : BaseManagerProtocol{
    private let _personalInfoDataRepository = PersonalInfoDataRepository()
    
    func create(record: PersonalInformation) {
        _personalInfoDataRepository.create(record: record)
    }
    
    func fetchALL() -> [PersonalInformation]? {
        _personalInfoDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [PersonalInformation]? {
        _personalInfoDataRepository.get(byName: name)
    }
    
    func updateRecord(record: PersonalInformation) -> Bool {
        _personalInfoDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name : String) -> Bool {
        _personalInfoDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDPersonalInformation]
    {
        _personalInfoDataRepository.getALLRecords()!
    }
        
  typealias T = PersonalInformation
}
