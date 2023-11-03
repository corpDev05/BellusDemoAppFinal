//
//  SearchEmployeeViewModel.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 31/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class SearchEmployeeViewModel {
    var employeeSearchModel : [EmployeeSearchModel] = [EmployeeSearchModel(name: "John Doe", designation: "Associate UI/UX", email: "johnDoe@gmail.com", contactNo: 8374658282),EmployeeSearchModel(name: "John", designation: "Backend Developer", email: "john@gmail.com", contactNo: 893456867934),EmployeeSearchModel(name: "Max Doe", designation: "Frontend Developer", email: "max@gmail.com", contactNo: 9893674568),EmployeeSearchModel(name: "Peter Doe", designation: "iOS Developer", email: "peter@gmail.com", contactNo: 7812345678)]
    
    
    func getData(){
        APICaller.getTrendingMovies { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
            }
        }
    }
}
