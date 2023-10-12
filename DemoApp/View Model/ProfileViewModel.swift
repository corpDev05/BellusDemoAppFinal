//
//  File.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    var profileCellModel : [NewProfileCellModel] = [/*[NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Personal Information", description: "", placeholder: "", imgPlaceholder: "")])],*/NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Personal Information", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "First Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Middle Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Last Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Enter Bio", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Date of Birth", description: "", placeholder: "DD/MM/YYYY", imgPlaceholder: ""),ProfileCellModel(title: "Designation", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Department", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Years Of Experience", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Contact Number", description: "", placeholder: "+91 xxxxxxxxxx", imgPlaceholder: ""),ProfileCellModel(title: "Email ID", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "", placeholder: "", imgPlaceholder: "")])]
    
    var profileVCModel : [ProfileVCModel] = [ProfileVCModel(data:[NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Personal Information", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "First Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Middle Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Last Name", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Enter Bio", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Date of Birth", description: "", placeholder: "DD/MM/YYYY", imgPlaceholder: ""),ProfileCellModel(title: "Designation", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Department", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Years Of Experience", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "Contact Number", description: "", placeholder: "+91 xxxxxxxxxx", imgPlaceholder: ""),ProfileCellModel(title: "Email ID", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Skill set", description: "", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "skill 1", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "skill 2", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "skill 3", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "skill 4", placeholder: "", imgPlaceholder: ""),ProfileCellModel(title: "", description: "skill 5", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Current Project", description: "", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Previous Experience", description: "", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Training and Certification", description: "", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Academic Information", description: "", placeholder: "", imgPlaceholder: "")]),NewProfileCellModel(isExpandable: false, array: [ProfileCellModel(title: "Interest and Hobbies", description: "", placeholder: "", imgPlaceholder: "")])])]


    
    func numberOfSection() -> Int{
        return 2
    }
    
    func numberOfRowsInSection(_ sec : Int) -> Int {
    
        return 2
    }
}
