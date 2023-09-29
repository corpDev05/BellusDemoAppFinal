//
//  ViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 29/09/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class DahboardView_SideMenuTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
   var list = ["Dashboard","My Profile","Employee Profile","Events","Calendar","Apps","Job Feed Help","Log Out"]
    
     

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registe

        // Do any additional setup after loading the view.
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
