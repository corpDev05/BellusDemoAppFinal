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
    
    func get(byName name: String) -> [SkillSet]? {
        var skillSet : [SkillSet] = []
        let fetchRequest = NSFetchRequest<CDSkillSet>(entityName: "CDSkillSet")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else{return nil}
            result.forEach { (cdSkillSet) in
                skillSet.append(cdSkillSet.convertToSkillSet())
            }
            return skillSet
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: SkillSet) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.skill!)
        guard  result != nil else {
            return false
        }
        result!.skill = record.skill
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let skillSet = getRecords(byName: name)
        guard skillSet != nil else {return false}
        PersistentStorage.shared.context.delete(skillSet!)
        return true
    }
    
    typealias T = SkillSet
    
    private func getRecords(byName name : String) -> CDSkillSet? {
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDSkillSet>(entityName: "CDSkillSet")
         fetchRequest.predicate = NSPredicate(format: "name == %@", "\(name)")
         do {
             let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
             guard result != nil else{return nil}
             return  result
         } catch let error {
             debugPrint(error)
         }
        return nil
     }
    
}
