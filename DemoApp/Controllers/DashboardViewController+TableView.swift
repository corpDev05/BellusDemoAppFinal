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
        return dashboardViewModel.numberOfRows(in: 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dashboardViewModel.numberOfSection()
    }
    
    
    func setupTableView(){
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        dashboardTableView.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 0.8)
       dashboardTableView.estimatedRowHeight = 480.0
        self.registerCells()
    }
    
    func registerCells(){
        dashboardTableView.register(UITableViewCell.self, forCellReuseIdentifier: "dashBoardTblCell")
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dashboardTableView.dequeueReusableCell(withIdentifier: "dashBoardTblCell", for: indexPath)
        return cell
    }
    
    
}

