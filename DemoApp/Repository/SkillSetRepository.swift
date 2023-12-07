//
//  SkillSetRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol SkillSetRepository : BaseRepository {
}

struct SkillSetDataRepository : SkillSetRepository {
    func create(record: SkillSet) {
        let cdSkillSet = CDSkillSet(context: PersistentStorage.shared.context)
        cdSkillSet.skill = record.skill
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [SkillSet]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDSkillSet.self)
        var skillSet : [SkillSet] = []
        result?.forEach({ (cdSkillSet) in
            skillSet.append(cdSkillSet.convertToSkillSet())
        })
        return skillSet
    }
    
    func get(byName name: String) -> SkillSet? {
        <#code#>
    }
    
    func update(record: SkillSet) -> Bool {
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = SkillSet
}
