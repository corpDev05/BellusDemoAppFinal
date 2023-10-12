//
//  ProfileCellModel.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 09/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

struct ProfileCellModel {
    var title : String?
    var description : String?
    var placeholder : String?
    var imgPlaceholder : String?
}

struct NewProfileCellModel {
    var isExpandable : Bool?
    var  array : [ProfileCellModel]
}
struct ProfileVCModel {
    var data : [NewProfileCellModel]
}
