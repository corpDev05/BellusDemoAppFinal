//
//  PreviousExperienceRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol PreviousExperienceRepository : BaseRepository {
}

struct PreviousExperienceDataRepository : PreviousExperienceRepository{
    func create(record: PreviousExperience) {
        let cdPreviousExperience = CDPreviousExperience(context: PersistentStorage.shared.context)
        cdPreviousExperience.name = record.name
        cdPreviousExperience.organisation = record.organisation
        cdPreviousExperience.roleRespons = record.roleRespons
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [PreviousExperience]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPreviousExperience.self)
        var previousExperience : [PreviousExperience] = []
        result?.forEach({ (prevExp) in
            previousExperience.append(prevExp.convertToPreviousExperience())
        })
        return previousExperience
    }
    
    func get(byName name: String) -> [PreviousExperience]? {
        var previousExperience : [PreviousExperience] = []
        let fetchRequest = NSFetchRequest<CDPreviousExperience>(entityName: "CDPreviousExperience")
        fetchRequest.predicate = NSPredicate(format: "name CONTANINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else{
                return nil
            }
            result.forEach { (cdPreviousExperience) in
                previousExperience.append(cdPreviousExperience.convertToPreviousExperience())
            }
            return previousExperience
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: PreviousExperience) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.name!)
        guard  result != nil else {
            return false
        }
        result!.name = record.name
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let previousExperience = getRecords(byName: name)
        guard previousExperience != nil else {return false}
        PersistentStorage.shared.context.delete(previousExperience!)
        return true
    }
    
    typealias T = PreviousExperience
    
    private func getRecords(byName name : String) -> CDPreviousExperience? {
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDPreviousExperience>(entityName: "CDPreviousExperience")
         fetchRequest.predicate = NSPredicate(format: "name == %@", "\(name)")
         do {
             let result = try  PersistentStorage.shared.context.fetch(fetchRequest).first
             guard result != nil else{return nil}
             return  result
         } catch let error {
             debugPrint(error)
         }
        return nil
     }
    public func getALLRecords() -> [CDPreviousExperience]? {
        let fetchRequest  = NSFetchRequest<CDPreviousExperience>(entityName: "CDPreviousExperience")
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else { return [] }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
}
