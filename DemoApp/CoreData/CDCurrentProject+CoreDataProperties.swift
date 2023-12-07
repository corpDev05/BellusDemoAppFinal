//
//  CDCurrentProject+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDCurrentProject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCurrentProject> {
        return NSFetchRequest<CDCurrentProject>(entityName: "CDCurrentProject")
    }

    @NSManaged public var projectName: String?
    @NSManaged public var reportingManager: String?
    @NSManaged public var rolesResp: [NSString]?
    
    func convertToCurrentProject() -> CurrentProject {
        return CurrentProject(projectName : self.projectName , reportingManager : self.reportingManager , rolesResp : self.rolesResp)
    }

}
