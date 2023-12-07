//
//  CDPreviousExperience+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDPreviousExperience {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPreviousExperience> {
        return NSFetchRequest<CDPreviousExperience>(entityName: "CDPreviousExperience")
    }

    @NSManaged public var organisation: String?
    @NSManaged public var name: String?
    @NSManaged public var roleRespons: [NSString]?
    
    func convertToPreviousExperience() -> PreviousExperience {
        return PreviousExperience(organisation : self.organisation , name : self.name , roleRespons : self.roleRespons)
    }

}
