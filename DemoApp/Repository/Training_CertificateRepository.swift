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
    
    func get(byName name: String) -> [Training_Certificate]? {
        var training_Certificate : [Training_Certificate] = []
        let fetchRequest = NSFetchRequest<CDTrainingNCertificate>(entityName: "CDTrainingNCertificate")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS  %@", "\(name)")
        do {
            let result =  try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else{return nil}
            result.forEach { (cdTrainingNCertificate) in
                training_Certificate.append(cdTrainingNCertificate.convertToCertificate())
            }
            return training_Certificate
            
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    func update(record: Training_Certificate) -> Bool {
        guard record != nil else {return false}
        let result = getRecords(byName: record.nameOfTraining!)
        guard  result != nil else {
            return false
        }
        result!.nameOfTraining = record.nameOfTraining
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byName name: String) -> Bool {
        let trainingNcertificates = getRecords(byName: name)
        guard trainingNcertificates != nil else {return false}
        PersistentStorage.shared.context.delete(trainingNcertificates!)
        return true
    }
    
    typealias T = Training_Certificate
    
    private func getRecords(byName name : String) -> CDTrainingNCertificate?{
        // var interest_Hobbies : Interest_Hobbies?
         let fetchRequest = NSFetchRequest<CDTrainingNCertificate>(entityName: "CDTrainingNCertificate")
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
    public func getALLRecords() -> [CDTrainingNCertificate]? {
        let fetchRequest  = NSFetchRequest<CDTrainingNCertificate>(entityName: "CDTrainingNCertificate")
        
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
