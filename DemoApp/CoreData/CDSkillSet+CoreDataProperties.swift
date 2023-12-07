//
//  CDSkillSet+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDSkillSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDSkillSet> {
        return NSFetchRequest<CDSkillSet>(entityName: "CDSkillSet")
    }

    @NSManaged public var skill: String?
    
    func convertToSkillSet() -> SkillSet {
        return SkillSet(skill : self.skill)
    }

}
