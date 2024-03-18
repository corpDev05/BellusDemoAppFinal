//
//  DashboardViewController.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 28/09/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//
import SideMenu
import UIKit
import SDWebImage
class DashboardViewController: UIViewController{
 
    var menu : SideMenuNavigationController?
   // @IBOutlet var activityIndicator: UIActivityIndicatorView!
    let identifier = "my-first-notification"
    let identifierContainer = ["my-first-notification","my-second-notification","my-third-notification","my-fourth-notification"]
   // let identifier2 = "beta-first-notification"
    let titleText = "This is my second notificaiton sent!"
    let titleContainer = ["This is my first notification sent!","This is my second notification sent!","This is my third notificaiton sent!","This is my fourth notification sent!"]
    let body = "Hello I am elon musk, the battery of my tesla ran out send me 50$ for uber i will send you 5000$ after i reach home"
    let bodyContainer = ["Hello I am elon musk, the battery of my tesla ran out, send me 10$ for uber i will send you 1000$ after i reach home","Hello I am elon musk, the battery of my tesla ran out, send me 20$ for uber i will send you 2000$ after i reach home","Hello I am elon musk, the battery of my tesla ran out, send me 30$ for uber i will send you 3000$ after i reach home","Hello I am elon musk, the battery of my tesla ran out, send me 40$ for uber i will send you 4000$ after i reach home","Hello I am elon musk, the battery of my tesla ran out, send me 50$ for uber i will send you 5000$ after i reach home"]
   // let hour = 10
    //let minute = 02
    let time = (hour:16,minute:53,second:00)
    let timeContainer = [(hour:14,minute:49,second:00),(hour:14,minute:49,second:08),(hour:14,minute:49,second:16),(hour:14,minute:49,second:24)]
    //let time2 = (17,03)
    let isDaily = true
    

    var newcellDataSource : [Movie] = []
    var fakeResponseCellData : [FakeStoreResponseElement] = []
    var cellDataSource : [DashboardTblCellViewModel] = []
    let manager : EmployeeManager = EmployeeManager()
    
    @IBOutlet var dashboardTableView: UITableView!
    var dashboardViewModel : DashboardViewModel = DashboardViewModel()
    override func viewDidLoad(){
        super.viewDidLoad()
        setupTableView()
        setupSideControllerMenu()
        setupNavBar()
    // bindViewModel()
        //createEmployee()
        //fetchEmployee()
        deleteRecord()
        APICall()
        checkForPermission()
    }
    
    func checkForPermission(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                do{
                    notificationCenter.requestAuthorization(options: [.alert,.sound]) { didAllow, error in
                        if(didAllow){
                            if(didAllow){
                            //   self.dispatchNotification()
   
                              for (index,item) in self.titleContainer.enumerated(){
                    NotificatioHandler.dispatchNotification(self.timeContainer[index], self.titleContainer[index], self.bodyContainer[index], self.isDaily)
                               }
                            }

                        }
                        
                    }
                }
            case .denied:
                return
            case .authorized:
                do{
                    notificationCenter.requestAuthorization(options: [.alert,.sound]) { didAllow, error in
                        if(didAllow){
                            if(didAllow){
                            //   self.dispatchNotification()
   
                              for (index,item) in self.titleContainer.enumerated(){
                    NotificatioHandler.dispatchNotification(self.timeContainer[index], self.titleContainer[index], self.bodyContainer[index], self.isDaily)
                               }
                            }

                        }
                        
                    }
                }
              
            default:
                return
            }
        }
    }
    
    /*func dispatchNotification(){
        let identifier = "my-first-notification"
        let title = "This is my first notificaiton sent!"
        let body = "Hello I am elon musk the battery of my tesla ran out send me 20$ for uber i will send you 2000$"
        let hour = 17
        let minute = 02
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar,timeZone: TimeZone.current )
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }*/
        
    func APICall() {
        
        let group  = DispatchGroup()
        let bp1 = BlockOperation{
        group.enter()
        debugPrint("Entering the get Trending Movies")
        APICaller.getTrendingMovies { [weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    self?.newcellDataSource = data.results
                  //  debugPrint(" Api data count is \(self?.newcellDataSource.count)")
                   // debugPrint("\(self?.newcellDataSource[0].firstAirDate)")
                  
                }
            } 
            debugPrint("Exiting the get Trending Movies")
            group.leave()
            
           // self?.reloadTableView()
        }
        group.wait()
        }
       
        let bp2 = BlockOperation{
            debugPrint("Entering the get Fake Response")
            debugPrint("The count of data from Trending movies is \(self.newcellDataSource.count)")
            APICaller.getSearchData("electronics", completionHandler: {[weak self] result in
                    switch result{
                    case .success(let data) :
                        do{
                            self?.fakeResponseCellData = data
                            debugPrint("Api data count from fake response is \(self?.fakeResponseCellData.count)")
                            
                            
                        }
                    case .failure(let error):
                        do{
                            debugPrint("Error fetching data from API with description: \(error.localizedDescription)")
                        }
                        
                    }
                    debugPrint("Existing the get Fake Response")
                    self?.reloadTableView()
                    
            })
        }
        
       // group.notify(queue: .main) {
       ////     debugPrint("Entering the maint thread")
       ////     self.reloadTableView()
       // }
        bp2.addDependency(bp1)
        let queue = OperationQueue()
        queue.addOperations([bp1,bp2],waitUntilFinished:true)

    }
    func deleteRecord(){
        manager.deleteAll()
    }
    
    func createEmployee() {
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = "John Doe"
        employee.designation = "UI/UX Designer"
        employee.email = "johnDoe@bellurbis.com"
        employee.contactNo = 7983253849
        PersistentStorage.shared.saveContext()
    }
    
    /*func fetchEmployee()
    {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {return}
            
            result.forEach({debugPrint("\($0.name) \($0.designation) \($0.email) \($0.contactNo)")})
        }
         catch let error{
            debugPrint(error)
        }
    }*/
    
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
    
  
