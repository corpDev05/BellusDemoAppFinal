//
//  PersonalInfoDataRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol PersonalInfoRepository : BaseRepository {
}

struct PersonalInfoDataRepository : PersonalInfoRepository {
    func create(record: PersonalInformation) {
        let cdpersonalInformation = CDPersonalInformation(context: PersistentStorage.shared.context)
        cdpersonalInformation.firstName = record.firstName
        cdpersonalInformation.lastName = record.lastName
        cdpersonalInformation.bio = record.bio
        cdpersonalInformation.contactNumber = record.contactNumber
        cdpersonalInformation.dateOfBirth = record.dateOfBirth
        cdpersonalInformation.department = record.department
        cdpersonalInformation.designation = record.designation
        cdpersonalInformation.emailID = record.emailID
        cdpersonalInformation.middleName = record.middleName
        cdpersonalInformation.yearsOfExperience = record.yearsOfExperience
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [PersonalInformation]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPersonalInformation.self)
        var personalInformation : [PersonalInformation] = []
        result?.forEach({(pInfo) in personalInformation.append(pInfo.convertToPersonalInformation())})
        return personalInformation
    }
    
    func get(byName name: String) -> [PersonalInformation]? {
        var personalInformation : [PersonalInformation] = []
        let fetchRequest = NSFetchRequest<CDPersonalInformation>(entityName: "CDPersonalInformation")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else {return nil}
            result.forEach { (cdPersonalInformation) in
                personalInformation.append(cdPersonalInformation.convertToPersonalInformation())
            }
            return personalInformation
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: PersonalInformation) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.firstName!)
        guard  result != nil else {
            return false
        }
        result!.firstName = record.firstName
        result!.middleName = record.middleName
        result!.lastName = record.lastName
        result!.dateOfBirth  = record.dateOfBirth
        result!.bio = record.bio
        result!.contactNumber = record.contactNumber
        result!.department = record.department
        result!.designation = record.designation
        result!.emailID = record.emailID
        result!.yearsOfExperience = record.yearsOfExperience
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let personalInformation = getRecords(byName: name)
        guard personalInformation != nil else {return false}
        PersistentStorage.shared.context.delete(personalInformation!)
        return true
    }
    
    typealias T = PersonalInformation
    
    public func getRecords(byName name : String) -> CDPersonalInformation? {
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDPersonalInformation>(entityName: "CDPersonalInformation")
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
    public func getALLRecords() -> [CDPersonalInformation]? {
        let fetchRequest  = NSFetchRequest<CDPersonalInformation>(entityName: "CDPersonalInformation")
        
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
