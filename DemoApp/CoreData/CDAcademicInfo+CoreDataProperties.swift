//
//  CDAcademicInfo+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDAcademicInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAcademicInfo> {
        return NSFetchRequest<CDAcademicInfo>(entityName: "CDAcademicInfo")
    }

    @NSManaged public var course: String?
    @NSManaged public var specialization: String?
    
    func convertToAcademicInfo() -> AcademicInfo{
        return AcademicInfo(course : self.course , specialization : self.specialization)
    }
    
}
