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
        guard record != nil else {return false}
        let result = getRecords(byName: record.course!)
        guard  result != nil else {
            return false
        }
        result!.course = record.course
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let academicInfo = getRecords(byName: name)
        guard academicInfo != nil else {return false}
        PersistentStorage.shared.context.delete(academicInfo!)
        return true
    }
    
    typealias T = AcademicInfo
    
    private func getRecords(byName name : String) -> CDAcademicInfo? {
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDAcademicInfo>(entityName: "CDAcademicInfo")
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
    public func getALLRecords() -> [CDAcademicInfo]? {
        let fetchRequest  = NSFetchRequest<CDAcademicInfo>(entityName: "CDAcademicInfo")
        
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
