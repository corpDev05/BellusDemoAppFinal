//
//  SideMenuTableViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 29/09/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//
import SideMenu
import UIKit

class SideMenuTableViewController: UITableViewController {

    var list = ["Dashboard","My Profile","Employee Profile","Events","Calendar","Apps","Job Feed Help","Log Out"]
     

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }
    
    func setupTableView()
    {
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
        
        if  list[indexPath.row] == "Dashboard"
        {
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "dashboardVC") as? DashboardViewController
            
            self.navigationController?.pushViewController(vc!, animated: false)
        }
        else if list[indexPath.row] == "My Profile"
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "profileVC") as? ProfileViewVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if list[indexPath.row] == "Employee Profile"
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "searchEmpVC") as? SearchEmpViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if  list[indexPath.row] == "Log Out"
        {
            let alert = UIAlertController(title: "Do you want to log out?", message: "", preferredStyle: .alert)
            let yesBtn = UIAlertAction(title: "Yes", style: .default) { _ in UserDefaults.standard.removeObject(forKey: "Email")
                UserDefaults.standard.removeObject(forKey: "Password")
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginPageVC") as? LoginPageController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            
            let noBtn = UIAlertAction(title: "No", style: .default, handler: nil)
            alert.addAction(yesBtn)
            alert.addAction(noBtn)
            present(alert, animated: true, completion: nil)
                    //invoke removeObject(forKey:)
         /*   UserDefaults.standard.removeObject(forKey: "Email")
            UserDefaults.standard.removeObject(forKey: "Password")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginPageVC") as? LoginPageController
             self.navigationController?.pushViewController(vc!, animated: true)*/
          
        }
    
    }
}
