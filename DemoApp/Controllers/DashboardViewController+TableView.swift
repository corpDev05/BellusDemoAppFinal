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
        if(section == 0){
            return newcellDataSource.count
        }
        else if (section == 1){
            return fakeResponseCellData.count
        }
        //return dashboardViewModel.numberOfRows(in: 0)
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        //return newcellDataSource.count
        //return dashboardViewModel.numberOfSection()
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
        dashboardTableView.estimatedRowHeight = UITableView.automaticDimension
        self.registerCells()
    }
    
    func registerCells(){
        
       // dashboardTableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "dashBoardTblCell")
      
        let customTableViewCellNib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
           dashboardTableView.register(customTableViewCellNib, forCellReuseIdentifier: "dashBoardTblCell")
        //dashboardTableView.register(DashboardTableViewCell.self,forCellReuseIdentifier: //"dashBoardTblCell")
        //dashboardTableView.register(UITableViewCell.self, forCellReuseIdentifier: "dashBoardTblCell")
    }
    
  /*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 20, y: 10, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = section == 0 ? "Movies" : "Products"
            label.font = .systemFont(ofSize: 16)
        label.textColor = .black
            
            headerView.addSubview(label)
            
            return headerView
    }*/
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell =  dashboardTableView.dequeueReusableCell(withIdentifier: "dashBoardTblCell", for: indexPath) as! DashboardTableViewCell
//          let cellViewModel = cellDataSource[indexPath.row]
        //cell.setupCell(viewModel: cellViewModel)
        if(indexPath.section == 0){
            cell.userName.text = newcellDataSource[indexPath.row].name ?? newcellDataSource[indexPath.row].title
            cell.dateOfPost.text  = newcellDataSource[indexPath.row].firstAirDate
            cell.postLabel.text = newcellDataSource[indexPath.row].overview
            cell.uploadedImage.sd_setImage(with:URL(string: "\(NetworkConstant.shared.imageServerAddress)\(newcellDataSource[indexPath.row].posterPath)"))
            
            return cell
        }
        if( indexPath.section == 1)
        {
            cell.userName.text = fakeResponseCellData[indexPath.row].title 
            cell.dateOfPost.text  = "$"+String(fakeResponseCellData[indexPath.row].price)
            cell.postLabel.text = fakeResponseCellData[indexPath.row].description
            cell.uploadedImage.sd_setImage(with:URL(string: fakeResponseCellData[indexPath.row].image))
            
            return cell
        }
        return UITableViewCell()
    }
    
  /*  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }*/
   
    
}

