//
//  AcademicInfoRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol AcademicInfoRepository : BaseRepository {
}

struct AcademicInfoDataRepository : AcademicInfoRepository {
    func create(record: AcademicInfo) {
        let cdAcademicInfo = CDAcademicInfo(context: PersistentStorage.shared.context)
        cdAcademicInfo.course = record.course
        cdAcademicInfo.specialization = record.course
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [AcademicInfo]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDAcademicInfo.self)
        var academicInfo : [AcademicInfo] = []
        result?.forEach({ (acadInfo) in
            academicInfo.append(acadInfo.convertToAcademicInfo())
        })
        return academicInfo
    }
    
    func get(byName name: String) -> [AcademicInfo]? {
        var academicInfo : [AcademicInfo] = []
        let fetchRequest = NSFetchRequest<CDAcademicInfo>(entityName: "CDAcademicInfo")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else {
                return nil
            }
            result.forEach { (cdAcademicInfo) in
                academicInfo.append(cdAcademicInfo.convertToAcademicInfo())
            }
            return academicInfo
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: AcademicInfo) -> Bool {
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = AcademicInfo
}
