//
//  SideMenuTableViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 29/09/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    var list = ["Dashboard","My Profile","Employee Profile","Events","Calendar","Apps","Job Feed Help","Log Out"]
     

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell.textLabel?.text == "Log out"
        {
            
            self.navigationController?.popToRootViewController(animated: true)
        }
    
    }
}