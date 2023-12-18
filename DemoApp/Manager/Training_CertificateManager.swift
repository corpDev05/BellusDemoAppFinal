//
//  Training_CertificateManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 08/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct Training_CertificateManager : BaseManagerProtocol{
    private let _training_CertificateDataRepository = Training_CertificateDataRepository()
    func create(record: Training_Certificate) {
        _training_CertificateDataRepository.create(record: record)
    }
    
    func fetchALL() -> [Training_Certificate]? {
        _training_CertificateDataRepository.getAll()
    }
    
    func fetchRecord(byName name: String) -> [Training_Certificate]? {
        _training_CertificateDataRepository.get(byName: name)
    }
    
    func updateRecord(record: Training_Certificate) -> Bool {
        _training_CertificateDataRepository.update(record: record)
    }
    
    func deleteRecord(byName name: String) -> Bool {
        _training_CertificateDataRepository.delete(byName: name)
    }
    func getAllRecord() -> [CDTrainingNCertificate]
    {
        _training_CertificateDataRepository.getALLRecords()!
    }
    
    typealias T = Training_Certificate
}
