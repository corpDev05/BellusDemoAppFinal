//
//  CurrentProjectRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol CurrentProjectRepository : BaseRepository {
}

struct CurrentProjectDataRepository : CurrentProjectRepository {
    func create(record: CurrentProject) {
        let cdCurrentProject = CDCurrentProject(context: PersistentStorage.shared.context)
        cdCurrentProject.projectName = record.projectName
        cdCurrentProject.reportingManager = record.reportingManager
        cdCurrentProject.rolesResp = record.rolesResp
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [CurrentProject]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDCurrentProject.self)
        var currentProject : [CurrentProject] = []
        result?.forEach({ (currProj) in
            currentProject.append(currProj.convertToCurrentProject())
        })
        return currentProject
    }
    
    func get(byName name: String) -> [CurrentProject]? {
        var currentProject : [CurrentProject] = []
        let fetchRequest = NSFetchRequest<CDCurrentProject>(entityName: "CDCurrentProject")
        fetchRequest.predicate = NSPredicate(format: "name CONTANINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else{
                return nil
            }
            result.forEach { (cdCurrentProject) in
                currentProject.append(cdCurrentProject.convertToCurrentProject())
            }
            return currentProject
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: CurrentProject) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.projectName!)
        guard  result != nil else {
            return false
        }
        result!.projectName = record.projectName
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let currentProject = getRecords(byName: name)
        guard currentProject != nil else {return false}
        PersistentStorage.shared.context.delete(currentProject!)
        return true
    }
    
    typealias T = CurrentProject
    
    private func getRecords(byName name : String) -> CDCurrentProject? {
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDCurrentProject>(entityName: "CDCurrentProject")
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
