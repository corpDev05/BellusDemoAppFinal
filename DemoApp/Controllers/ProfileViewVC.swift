//
//  ProfileViewVC.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 05/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//
import SideMenu
import UIKit

class ProfileViewVC : UIViewController , ProfileTVCellDelegate ,ProfileVCCellEditDelegate{
    
    var profileViewModel : ProfileViewModel = ProfileViewModel()
    
    
  //  var cellVC = ProfileVCTableViewCell()
    public let personalInfoManager = PersonalInfoManager()
    public let skillSetManager = SkillSetManager()
    public let currentProjectManager = CurrentProjectManager()
    public let previousExperienceManager = PreviousExperienceManager()
    public let interest_HobbiesManager = Interest_HobbiesManager()
    public let academicInfoManager  = AcademicInfoManager()
    public let training_certificateManager = Training_CertificateManager()
    var personalInfo : PersonalInformation?
    var skill : [SkillSet] = []
    var currProj : CurrentProject?
    var prevExp : [PreviousExperience] = []
    var interest_Hobbies : [Interest_Hobbies] = []
    var academicInfo : [AcademicInfo] = []
    var training : [Training_Certificate] = []
    var menu : SideMenuNavigationController?
    var edit : Bool  = false
    var section : Int = 0
   // var  profileViewModel : ProfileCellModel
    @IBOutlet var profileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSideControllerMenu()
        setupTableView()
        createDatabase()
       // cellVC.delegate = self
        // Do any additional setup after loading the view.
    }
   /* override func viewWillAppear(_ animated: Bool) {
        profileTable.estimatedRowHeight = 100
        profileTable.rowHeight = UITableView.automaticDimension
      //  profileTable.autoresizesSubviews = true
        }*/
    
    func createDatabase(){
         personalInfo  = PersonalInformation(firstName: "John", middleName: "", lastName: "Doe", bio: "I create visual concepts,develops overall layout & communication ideas that inspire,inform and captivate consumers", dateOfBirth: DateFormatter().date(from:"DD/MM/YYYY"), designation: "Designer", department: "Information Technology", yearsOfExperience: 15, contactNumber: 2563365825, emailID: "JohnDoe@Example.com")
         skill = [SkillSet(skill: "DSA"),SkillSet(skill: "OOP"),SkillSet(skill: "iOS Development"),SkillSet(skill: "Swift"),SkillSet(skill: "Core Data"),SkillSet(skill: "API integration")]
        
         currProj = CurrentProject(projectName: "ORCA", reportingManager: "Jane Doe", rolesResp: ["UI Designing","Prototyping","Wireframing","UX Research"])
        
        prevExp  = [PreviousExperience(organisation: "ABC Technologies", name: "ORCA", roleRespons: ["Designing user interfaces and clickable prototypes"]),PreviousExperience(organisation: "ABC Technologies", name: "Telemedicine", roleRespons: ["Designing user interfaces and clickable prototypes"]),PreviousExperience(organisation: "ABC Technologies", name: "Poker - Anuvaka", roleRespons: ["Designing user interfaces and clickable prototypes"])]
        
        interest_Hobbies = [Interest_Hobbies(interestName: "Excercising"),Interest_Hobbies(interestName: "Watching Movies/Shows"),Interest_Hobbies(interestName: "Tennis"),Interest_Hobbies(interestName: "Exploring new places"),Interest_Hobbies(interestName: "Learning new things"),Interest_Hobbies(interestName: "Hiking"),Interest_Hobbies(interestName: "Exploring new places")]
        
         academicInfo = [AcademicInfo(course: "Post Graduation", specialization: "XYZ"),AcademicInfo(course: "B.Tech", specialization: "Electronics")]
        
        training = [Training_Certificate(nameOfTraining: "DSA"),Training_Certificate(nameOfTraining: "Object-Oriented Programming"),Training_Certificate(nameOfTraining: "Protocol-Oriented Programming"),Training_Certificate(nameOfTraining: "iOS Development"),Training_Certificate(nameOfTraining: "Swift")]
        for acad in academicInfo {
            academicInfoManager.create(record: acad)
        }
        for trainings in training {
            training_certificateManager.create(record: trainings)
        }
        
        for hobbies in interest_Hobbies {
            interest_HobbiesManager.create(record: hobbies)
        }
        
        for exp in prevExp {
            previousExperienceManager.create(record: exp)
        }
        currentProjectManager.create(record: currProj!)
        for skills in skill {
            skillSetManager.create(record: skills)
        }
        personalInfoManager.create(record: personalInfo!)
    }

    
    func setupNavBar(){
        
        self.navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        self.navigationItem.title = "Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "hamburgerMenu"), style: .plain, target: self, action: #selector(presentSideMenu))
        if #available(iOS 13.0, *) {
            self.navigationItem.compactAppearance?.backgroundColor = UIColor(displayP3Red: 225/255, green: 253/255, blue: 255/255, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        
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

