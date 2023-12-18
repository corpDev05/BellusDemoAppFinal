//
//  AcademicInfoManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct AcademicInfoManager : BaseManagerProtocol {
     private let _academicInfoDataRepository = AcademicInfoDataRepository()
    func create(record: AcademicInfo) {
        _academicInfoDataRepository.create(record: record)
    }
    
    func fetchALL() -> [AcademicInfo]? {
        _academicInfoDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [AcademicInfo]? {
        _academicInfoDataRepository.get(byName: name)
    }
    
    func updateRecord(record: AcademicInfo) -> Bool {
        _academicInfoDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _academicInfoDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDAcademicInfo]
    {
        _academicInfoDataRepository.getALLRecords()!
    }
        
    
    typealias T = AcademicInfo
}
