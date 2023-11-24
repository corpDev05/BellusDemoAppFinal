//
//  Employee+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 21/11/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var designation: String?
    @NSManaged public var email: String?
    @NSManaged public var contactNo: Int64
 //   @NSManaged public var id: UUID?
    
    func convertToEmployee() -> Employees {
        return Employees(email: self.email, designation: self.designation, name: self.name,/*id: self.id!*/contactNo: self.contactNo)
    }

}
