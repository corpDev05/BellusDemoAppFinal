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
    func reloadTable(result : [Employees]?)
    {
        guard result != nil else{
            tblViewHeaderText = "Found 0 result"
            searchResultTbl.reloadData()
           return
        }
        tblViewHeaderText = "Found \(result!.count)"
        searchEmployeeViewModel.employeeSearchModel = result as! [Employees]
        searchResultTbl.reloadData()
        
    }
    func reloadResultTable(_ result : [Datum])
    {
        searchResultTbl.reloadData()
    }
    func registerCell(){
        let customTableViewCellNib = UINib(nibName: "SearchResTblViewCell", bundle: nil)
        searchResultTbl.register(customTableViewCellNib, forCellReuseIdentifier: "searchResult")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = tblViewHeaderText
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            headerView.addSubview(label)
            return headerView
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count //searchEmployeeViewModel.employeeSearchModel.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTbl.dequeueReusableCell(withIdentifier: "searchResult",for : indexPath) as! SearchResTblViewCell
        
        cell.resultName.text = cellData[indexPath.row].name //searchEmployeeViewModel.employeeSearchModel[indexPath.row].name
        cell.resultEmail.text = cellData[indexPath.row].color
        // searchEmployeeViewModel.employeeSearchModel[indexPath.row].email
        cell.resultDesignation.text = cellData[indexPath.row].manufacturer// searchEmployeeViewModel.employeeSearchModel[indexPath.row].designation
        cell.resultContact.text =  cellData[indexPath.row].operatingSystem// String(searchEmployeeViewModel.employeeSearchModel[indexPath.row].contactNo ?? 91)
            return cell
       
    }
    
    
    
}
