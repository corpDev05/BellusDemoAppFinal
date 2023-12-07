//
//  Training_CertificateRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol Training_CertificateRepository : BaseRepository {
}

struct Training_CertificateDataRepository : Training_CertificateRepository {
    func create(record: Training_Certificate) {
        let cdTrainingNCertificate = CDTrainingNCertificate(context: PersistentStorage.shared.context)
        cdTrainingNCertificate.nameOfTraining = record.nameOfTraining
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Training_Certificate]? {
        let result =  PersistentStorage.shared.fetchManagedObject(managedObject: CDTrainingNCertificate.self)
        var training_certificate : [Training_Certificate] = []
        result?.forEach({ (cdTrainingNCertificate) in
            training_certificate.append(cdTrainingNCertificate.convertToCertificate())
        })
        return training_certificate
        
    }
    
    func get(byName name: String) -> Training_Certificate? {
        <#code#>
    }
    
    func update(record: Training_Certificate) -> Bool {
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = Training_Certificate
}
