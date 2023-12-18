//
//  DashboardViewModel.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 03/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class DashboardViewModel {
    var isLoading : Observable<Bool> = Observable(false)
    var dataSource : APIResultModel?
    var cellDataSource : Observable<[DashboardTblCellViewModel]> = Observable(nil)
    var postModel : [PostModel] = [PostModel(name: "John Doe", designation: "HR"),PostModel(name: "Devesh Pandey", designation: "iOS Developer"),PostModel(name: "Manmohan Pandey", designation: "Backend Developer"),PostModel(name: "Himani Pandey", designation: "Sap Developer")]
    
    func cellData(_ indexPath : IndexPath) -> PostModel{
        return postModel[indexPath.row]
    }
    
    func numberOfSection()-> Int {
        return 1
    }
    
    func numberOfRows(in section : Int) -> Int{
        return dataSource?.results.count ?? 0
    }
    
    func getData(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] (result) in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
                print("Top Trending Counts: \(data.results.count)")
            }
        }
         
    }
    func mapCellData(){
        //self.cellDataSource.value = self.dataSource?.results ?? []
        self.cellDataSource.value = self.dataSource?.results.compactMap({DashboardTblCellViewModel(movie: $0)})
    }
}

