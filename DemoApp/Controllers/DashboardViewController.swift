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
 
    var menu : SideMenuNavigationController?
   // @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var cellDataSource : [DashboardTblCellViewModel] = []
    
    @IBOutlet var dashboardTableView: UITableView!
    var dashboardViewModel : DashboardViewModel = DashboardViewModel()
    override func viewDidLoad(){
        super.viewDidLoad()
        setupTableView()
        setupSideControllerMenu()
        setupNavBar()
        bindViewModel()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dashboardViewModel.getData()
    }
    
    func bindViewModel(){
        dashboardViewModel.isLoading.bind { [weak self](isLoading) in
            guard let self = self ,let isLoading = isLoading else
            {
                return
            }
            
        }
        dashboardViewModel.cellDataSource.bind { [weak self](movies) in
            guard let self = self ,let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func setupNavBar(){
        
        self.view.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        self.navigationItem.title = "Dashboard"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "hamburgerMenu"), style: .plain, target: self, action: #selector(presentSideMenu))
        self.navigationItem.compactAppearance?.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        let nav  = UINavigationController(rootViewController: DashboardViewController())
        appearence.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        
        nav.navigationBar.standardAppearance = appearence
        nav.navigationBar.compactAppearance = appearence
        nav.navigationBar.scrollEdgeAppearance = appearence
        
        nav.navigationBar.tintColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        nav.navigationBar.barTintColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
    
        
        
        
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
}
    
  
