//
//  Interest_HobbiesRepository.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/12/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData
protocol Interest_HobbiesRepository : BaseRepository {
}

struct Interest_HobbiesDataRepository : Interest_HobbiesRepository {
    func create(record: Interest_Hobbies) {
        let cdInterestNHobbies = CDInterestNHobbies(context: PersistentStorage.shared.context)
        cdInterestNHobbies.interestName = record.interestName
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Interest_Hobbies]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDInterestNHobbies.self)
        var interestNhobbies : [Interest_Hobbies] = []
        result?.forEach({ (interest_hobbies) in
            interestNhobbies.append(interest_hobbies.convertToInterestNHobbies())
        })
        return interestNhobbies
    }
    
    func get(byName name: String) -> Interest_Hobbies? {
        <#code#>
    }
    
    func update(record: Interest_Hobbies) -> Bool {
        <#code#>
    }
    
    func delete(byName name: String) -> Bool {
        <#code#>
    }
    
    typealias T = Interest_Hobbies
}
