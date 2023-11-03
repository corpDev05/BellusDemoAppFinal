//
//  SearchEmpViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 17/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit
import SideMenu
class SearchEmpViewController: UIViewController {
    var menu : SideMenuNavigationController?
    var edit : Bool  = false
   // var  profileViewModel : ProfileCellModel
    var searchEmployeeViewModel : SearchEmployeeViewModel = SearchEmployeeViewModel()
    @IBOutlet var searchView: UIView!
    @IBOutlet var topView: UIView!
    
    @IBOutlet var searchResultTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSetup()
        setupNavBar()
        setupSideControllerMenu()
        searchView.layer.cornerRadius = 4.0
        topView.layer.cornerRadius = 8.0
        topView.layer.borderColor = CGColor(srgbRed: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        topView.layer.borderWidth = 2.0
       // cellVC.delegate = self
        // Do any additional setup after loading the view.
    }
   /* override func viewWillAppear(_ animated: Bool) {
        profileTable.estimatedRowHeight = 100
        profileTable.rowHeight = UITableView.automaticDimension
      //  profileTable.autoresizesSubviews = true
        }*/
    
    override func viewDidAppear(_ animated: Bool) {
     //   print("\(searchEmployeeViewModel.getData())")
    }

    
    func setupNavBar(){
        
        self.navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        self.navigationItem.title = "Search Employee"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "hamburgerMenu"), style: .plain, target: self, action: #selector(presentSideMenu))
        self.navigationItem.compactAppearance?.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
      /*  let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        let nav  = UINavigationController(rootViewController: DashboardViewController())
        appearence.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
        nav.navigationBar.standardAppearance = appearence
        nav.navigationBar.compactAppearance = appearence
        nav.navigationBar.scrollEdgeAppearance = appearence
        
        nav.navigationBar.tintColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        nav.navigationBar.barTintColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
    */
        
        
        
    }
    
    @objc private func presentSideMenu(){
        present(menu!,animated: true)
    }
    
    func setupSideControllerMenu(){
        
        navigationItem.hidesBackButton  = true
      //navigationItem.accessibilityElementsHidden = true
        menu = SideMenuNavigationController(rootViewController: SideMenuTableViewController())
        menu?.leftSide = true
        menu?.presentationStyle = .menuSlideIn
        
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
