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
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = PreviousExperience
}
