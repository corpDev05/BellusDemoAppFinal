//
//  DashboardViewController+TableView.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 03/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import UIKit

extension  DashboardViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardViewModel.numberOfRows(in: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dashboardViewModel.numberOfSection()
    }
    
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.dashboardTableView.reloadData()
        }
    }
    
    
    func setupTableView(){
        self.view.addSubview(dashboardTableView)
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        dashboardTableView.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 0.8)
      //dashboardTableView.estimatedRowHeight = 480.0
        self.registerCells()
    }
    
    func registerCells(){
        
       // dashboardTableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "dashBoardTblCell")
      
        let customTableViewCellNib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
           dashboardTableView.register(customTableViewCellNib, forCellReuseIdentifier: "dashBoardTblCell")
        //dashboardTableView.register(UITableViewCell.self, forCellReuseIdentifier: "dashBoardTblCell")
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell =  dashboardTableView.dequeueReusableCell(withIdentifier: "dashBoardTblCell", for: indexPath) as! DashboardTableViewCell
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        //cell.userName.text = cellDataSource[indexPath.row]. ?? cellDataSource[indexPath.row].title
        //cell.postLabel.text = cellDataSource[indexPath.row].overview
        
        /*if indexPath.row == 0{
            cell.userName.text = dashboardViewModel.cellData(indexPath).name
            cell.userDesignation.text = dashboardViewModel.cellData(indexPath).designation
           return cell
        }
        else if indexPath.row == 1{
            cell.userName.text = dashboardViewModel.cellData(indexPath).name
            cell.userDesignation.text = dashboardViewModel.cellData(indexPath).designation
           return cell
        }
        else if indexPath.row == 2{
            cell.userName.text = dashboardViewModel.cellData(indexPath).name
            cell.userDesignation.text = dashboardViewModel.cellData(indexPath).designation
            return cell
        }
        else if indexPath.row == 3{
            cell.userName.text = dashboardViewModel.cellData(indexPath).name
            cell.userDesignation.text = dashboardViewModel.cellData(indexPath).designation
            return cell
        }*/
        return cell
    }
    
    
}

