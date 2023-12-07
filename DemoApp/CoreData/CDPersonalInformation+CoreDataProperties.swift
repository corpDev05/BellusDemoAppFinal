//
//  CDPersonalInformation+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDPersonalInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPersonalInformation> {
        return NSFetchRequest<CDPersonalInformation>(entityName: "CDPersonalInformation")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var middleName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var bio: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var designation: String?
    @NSManaged public var department: String?
    @NSManaged public var yearsOfExperience: Int16
    @NSManaged public var contactNumber: Int64
    @NSManaged public var emailID: String?
    
    func convertToPersonalInformation() -> PersonalInformation {
        return PersonalInformation(firstName : self.firstName , middleName : self.middleName , lastName : self.lastName , bio : self.bio , dateOfBirth : self.dateOfBirth , designation : self.designation , department : self.department , yearsOfExperience : self.yearsOfExperience , contactNumber : self.contactNumber , emailID : self.emailID)
    }

}
