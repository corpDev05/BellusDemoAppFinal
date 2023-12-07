//
//  Interest_HobbiesRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol Interest_HobbiesRepository : BaseRepository {
}

struct Interest_HobbiesDataRepository : Interest_HobbiesRepository {
    func create(record: Interest_Hobbies) {
        let cdInterestNHobbies = CDInterestNHobbies(context: PersistentStorage.shared.context)
        cdInterestNHobbies.interestName = record.interestName
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Interest_Hobbies]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDInterestNHobbies.self)
        var interestNhobbies : [Interest_Hobbies] = []
        result?.forEach({ (interest_hobbies) in
            interestNhobbies.append(interest_hobbies.convertToInterestNHobbies())
        })
        return interestNhobbies
    }
    
    func get(byName name: String) -> [Interest_Hobbies]? {
        var interest_Hobbies : [Interest_Hobbies] = []
        let fetchRequest = NSFetchRequest<CDInterestNHobbies>(entityName: "CDInterestNHobbies")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else {return nil}
            result.forEach { (cdInterestNHobbies) in
                interest_Hobbies.append(cdInterestNHobbies.convertToInterestNHobbies())
            }
            return interest_Hobbies
        } catch  let error{
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: Interest_Hobbies) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.interestName!)
        guard  result != nil else {
            return false
        }
        result!.interestName = record.interestName
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let interestNhobbies = getRecords(byName: name)
        guard interestNhobbies != nil else {return false}
        PersistentStorage.shared.context.delete(interestNhobbies!)
        return true
    }
    
    typealias T = Interest_Hobbies
    
   private func getRecords(byName name : String) -> CDInterestNHobbies? {
       // var interest_Hobbies : Interest_Hobbies?
        let fetchRequest = NSFetchRequest<CDInterestNHobbies>(entityName: "CDInterestNHobbies")
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
}
