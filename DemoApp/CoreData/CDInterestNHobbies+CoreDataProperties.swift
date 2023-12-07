//
//  CDInterestNHobbies+CoreDataProperties.swift
//  
//
//  Created by Bellubis-WS29 on 05/12/23.
//
//

import Foundation
import CoreData


extension CDInterestNHobbies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDInterestNHobbies> {
        return NSFetchRequest<CDInterestNHobbies>(entityName: "CDInterestNHobbies")
    }

    @NSManaged public var interestName: String?
    
    func convertToInterestNHobbies() -> Interest_Hobbies {
        return  Interest_Hobbies(interestName : self.interestName)
    }

}
