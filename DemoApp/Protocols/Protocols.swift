//
//  Protocols.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 10/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

protocol ProfileTVCellDelegate: AnyObject {
    func profileTVCell(_ section : Int, _ boolDrop: Bool)
}

protocol ProfileVCCellEditDelegate: AnyObject {
    func isEditable(_ section : Int ,_ editable : Bool)
}

protocol ProfileCellSaveBtnClkDelegate : AnyObject {
    func saveBtnClked(_ section : Int ,_ row : Int ,_ data : Any)
}
