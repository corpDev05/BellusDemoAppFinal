//
//  File.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    var profileCellModel : [ProfileCellModel] = [ProfileCellModel(title: "Personal Information"),ProfileCellModel(title: "First Name", description: ""),ProfileCellModel(title: "Middle Name", description: ""),ProfileCellModel(title: "Last Name", description: ""),ProfileCellModel(title: "Enter Bio", description: ""),ProfileCellModel(title: "Date of Birth", description: "", placeholder: "DD/MM/YYYY", imgPlaceholder: ""),ProfileCellModel(title: "Designation", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Department", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Years of Experience", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Contact Number", description: "+91", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Email ID", description: "", placeholder: "abc@xyz.com", imgPlaceholder: "")]
    
    
    func numberOfSection() -> Int{
        return 2
    }
    
    func numberOfRowsInSection(_ sec : Int) -> Int {
        if(sec == 0)
        {return 1}
        else
        {return profileCellModel.count}
    }
}
