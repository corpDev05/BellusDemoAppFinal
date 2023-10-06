//
//  DashboardViewModel.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 03/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    var postModel : [PostModel] = [PostModel(name: "John Doe", designation: "HR"),PostModel(name: "Devesh Pandey", designation: "iOS Developer"),PostModel(name: "Manmohan Pandey", designation: "Backend Developer"),PostModel(name: "Himani Pandey", designation: "Sap Developer")]
    
    func cellData(_ indexPath : IndexPath) -> PostModel{
        return postModel[indexPath.row]
    }
    
    func numberOfSection()-> Int {
        return 1
    }
    
    func numberOfRows(in section : Int) -> Int{
        return postModel.count
    }
    
}

