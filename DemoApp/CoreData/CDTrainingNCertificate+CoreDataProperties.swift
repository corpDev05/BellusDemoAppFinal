//
//  CDTrainingNCertificate+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDTrainingNCertificate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTrainingNCertificate> {
        return NSFetchRequest<CDTrainingNCertificate>(entityName: "CDTrainingNCertificate")
    }

    @NSManaged public var nameOfTraining: String?
    
    func convertToCertificate() -> Training_Certificate
    {
        return Training_Certificate(nameOfTraining : self.nameOfTraining)
    }
    
}
