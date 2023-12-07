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
        var personalInformation : [PersonalInformation]
        let fetchRequest = NSFetchRequest<CDPersonalInformation>(entityName: "CDPersonalInformation")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else {return nil}
            result.forEach { (cdPersonalInformation) in
                personalInformation.append(cdPersonalInformation.convertToPersonalInformation())
            }
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: PersonalInformation) -> Bool {
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = PersonalInformation
    
}
