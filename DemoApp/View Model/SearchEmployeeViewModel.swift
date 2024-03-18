//
//  SearchEmployeeViewModel.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 31/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class SearchEmployeeViewModel {
    var employeeSearchModel : [Employees] = []
    var  isLoading : Observable<Bool> = Observable(false)
    var  celldata : Observable<[Datum]> = Observable(nil)
    var  dataSource : SearchResponseResultModel?
    /*public init(employeeRes : [Employees]?)
    {
        guard employeeRes != nil else {
            employeeSearchModel = []
            return
        }
        self.employee = employeeRes
    }*/
    
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
    
    func getSearchData(_ name: String ,_ color: String){
        APICaller.searchProduct(name, color) { result in
            switch result {
            case .success(let data):
                self.dataSource = data
                self.mapData()
            case .failure(let error):
                print(error)
    
              }
    
        }
       
       }
    func mapData()
    {
        self.celldata.value = self.dataSource?.data ?? []
    }
}
