//
//  File.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewVC : UITableViewDelegate,UITableViewDataSource {
    
    func setupTableView() {
        self.view.addSubview(profileTable)
        profileTable.dataSource = self
        profileTable.delegate = self
        profileTable.backgroundColor = .cyan
        profileTable.estimatedRowHeight = 120.0
        profileTable.rowHeight = UITableView.automaticDimension
        registerCells()
    }
    
    func registerCells(){
        let customTableViewCellNib = UINib(nibName: "ProfileVCTableViewCell", bundle: nil)
           profileTable.register(customTableViewCellNib, forCellReuseIdentifier: "profileTblCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return profileViewModel.numberOfRowsInSection(0)
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTable.dequeueReusableCell(withIdentifier: "profileTblCell", for: indexPath) as! ProfileVCTableViewCell
        
        
        if indexPath.row == 0
        {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = false
            cell.descriptionBottmConst.isActive = true
            //cell.cellHeight.constant = 80
          //  tableView.numberOfRows(inSection: 0)
        }
           // tableView.reloadData()
       else if indexPath.row == 1 {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 2 {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 3 {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 4  {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 5 {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 6 {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 7  {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 8  {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 9  {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 10  {
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        else if indexPath.row == 11{
            cell.titleText.text = profileViewModel.profileCellModel[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileCellModel[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView(profileTable, numberOfRowsInSection: 1)
        self.profileTable.reloadData()
    }
}


