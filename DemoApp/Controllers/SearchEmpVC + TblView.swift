//
//  SearchEmpVC + TblView.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 27/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

extension  SearchEmpViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tblSetup() {
        self.view.addSubview(searchResultTbl)
        searchResultTbl.delegate = self
        searchResultTbl.dataSource = self
        searchResultTbl.rowHeight = UITableView.automaticDimension
        registerCell()
    }
    
    func registerCell(){
        let customTableViewCellNib = UINib(nibName: "SearchResTblViewCell", bundle: nil)
        searchResultTbl.register(customTableViewCellNib, forCellReuseIdentifier: "searchResult")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Found 3 result"
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            
            headerView.addSubview(label)
            
            return headerView
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEmployeeViewModel.employeeSearchModel.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTbl.dequeueReusableCell(withIdentifier: "searchResult",for : indexPath) as! SearchResTblViewCell
        
        if indexPath.row == 0 {
            cell.resultName.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].name
            cell.resultEmail.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].email
            cell.resultDesignation.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].designation
            cell.resultContact.text =  String(searchEmployeeViewModel.employeeSearchModel[indexPath.row].contactNo)
            return cell
        }
        if indexPath.row == 1 {
            cell.resultName.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].name
            cell.resultEmail.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].email
            cell.resultDesignation.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].designation
            cell.resultContact.text =  String(searchEmployeeViewModel.employeeSearchModel[indexPath.row].contactNo)
            return cell
        }
        if indexPath.row == 2 {
            cell.resultName.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].name
            cell.resultEmail.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].email
            cell.resultDesignation.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].designation
            cell.resultContact.text =  String(searchEmployeeViewModel.employeeSearchModel[indexPath.row].contactNo)
            return cell
        }

        if indexPath.row == 3 {
            cell.resultName.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].name
            cell.resultEmail.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].email
            cell.resultDesignation.text = searchEmployeeViewModel.employeeSearchModel[indexPath.row].designation
            cell.resultContact.text =  String(searchEmployeeViewModel.employeeSearchModel[indexPath.row].contactNo)
            return cell
        }


        return UITableViewCell()
    }
    
    
    
}