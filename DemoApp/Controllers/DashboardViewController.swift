//
//  DashboardViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 28/09/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//
import SideMenu
import UIKit

class DashboardViewController: UIViewController{
    
    var postModel : [PostModel] = []
    var menu : SideMenuNavigationController?
    @IBOutlet var navView: UIView!
    @IBOutlet var dashboardTableView: UITableView!
    var dashboardViewModel : DashboardViewModel = DashboardViewModel()
    override func viewDidLoad(){
        super.viewDidLoad()
        setupTableView()
        setupSideControllerMenu()
        
        
    }
    
    func setupSideControllerMenu(){
        
        navigationItem.hidesBackButton  = true
      //navigationItem.accessibilityElementsHidden = true
        menu = SideMenuNavigationController(rootViewController: SideMenuTableViewController())
        menu?.leftSide = true
        menu?.presentationStyle = .menuSlideIn
        
    }
    
    @IBAction func hamburgerMenu(_ sender: Any) {
        present(menu!,animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*class MenuListController: UITableViewController {
    
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
*/
