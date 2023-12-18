//
//  SkillSetManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct SkillSetManager : BaseManagerProtocol {
    private let _skillSetDataRepository = SkillSetDataRepository()
    func create(record: SkillSet) {
        _skillSetDataRepository.create(record: record)
    }
    
    func fetchALL() -> [SkillSet]? {
        _skillSetDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [SkillSet]? {
        _skillSetDataRepository.get(byName: name)
    }
    
    func updateRecord(record: SkillSet) -> Bool {
        _skillSetDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _skillSetDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDSkillSet]
    {
        _skillSetDataRepository.getALLRecords()!
    }
    
    typealias T = SkillSet
    
}
