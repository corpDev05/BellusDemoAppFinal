//
//  PreviousExperienceManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct PreviousExperienceManager : BaseManagerProtocol {
    private let _previousExperienceDataRepository = PreviousExperienceDataRepository()
    func create(record: PreviousExperience) {
        _previousExperienceDataRepository.create(record: record)
    }
    
    func fetchALL() -> [PreviousExperience]? {
        _previousExperienceDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [PreviousExperience]? {
        _previousExperienceDataRepository.get(byName: name)
    }
    
    func updateRecord(record: PreviousExperience) -> Bool {
        _previousExperienceDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _previousExperienceDataRepository.delete(byName: name)
    }
    
    typealias T = PreviousExperience
}
