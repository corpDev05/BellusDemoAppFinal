//
//  File.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewVC : UITableViewDelegate,UITableViewDataSource,ProfileCellSaveBtnClkDelegate,UITextViewDelegate{
    func saveBtnClked<T>(_ section: Int, _ row: Int, _ data: T) {
        debugPrint("section is \(section) , row is \(row) , data is \(data)")
        let sec = section
        let rw = row
        let dt = data as? String
        switch section {
        
        case 0 :
            do {
                var record = personalInfoManager.getAllRecord()
            switch row {
           // var firstName: String?
           // var middleName: String?
           // var lastName: String?
           // var bio: String?
           // var dateOfBirth: Date?
           // var designation: String?
           // var department: String?
           // var yearsOfExperience: Int16
           // var contactNumber: Int64
           // var emailID: String?
               
            case 1 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].firstName = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].middleName = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 3 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].lastName = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].bio = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 5 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].dateOfBirth = data as? Date
                    PersistentStorage.shared.saveContext()
                }
            case 6 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].designation = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 7 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].department = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 8 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].yearsOfExperience = (data as? Int16) ?? 1
                    PersistentStorage.shared.saveContext()
                }
            case 9 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].contactNumber = (data as? Int64) ?? 7239239024
                    PersistentStorage.shared.saveContext()
                }
            case 10 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].emailID = data as? String
                    debugPrint(data)
                    personalInfo?.emailID  = data as? String
                    PersistentStorage.shared.saveContext()
                }
             
            default:
                debugPrint("Error")
            }
                 let indexSet = IndexSet(integer: section)
                profileTable.reloadSections(indexSet, with: .none)
        }
        case 1 : do {
            var record = skillSetManager.fetchALL()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record?[0].skill = data as? String
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record?[1].skill = data as? String
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record?[2].skill = data as? String
                }
            case 4:
                do {
                    guard record != nil else{ return }
                    record?[3].skill = data as? String
                }
            case 5:
                do {
                    guard record != nil else{ return }
                    record?[4].skill = data as? String
                }
            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }
        
        default:
            debugPrint("Error in saving changes to Core Data")
        }
    }
    
   // var personalInfo : PersonalInformation?
   // var skill : [SkillSet] = []
   // var currProj : CurrentProject?
   // var prevExp : [PreviousExperience] = []
   // var interest_Hobbies : [Interest_Hobbies] = []
   // var academicInfo : [AcademicInfo] = []
    
    //personalInfo = personalInfoManager.fetchALL()
    //skill = skillSetManager.fetchALL()
    //currProj = currentProjectManager.fetchALL()
    //prevExp = previousExperienceManager.fetchALL()
    //interest_Hobbies =  interest_HobbiesManager.fetchALL()
    //academicInfo = academicInfoManager.fetchALL()
    
    func isEditable(_ section : Int,_ editable : Bool){
        profileViewModel.profileVCModel[0].data[section].isEditable = editable
        var indexSet : IndexSet = [section]
        self.profileTable.reloadSections(indexSet, with: .automatic)
       //self.profileTable.reloadData()
    }
    func profileTVCell(_ section : Int, _ boolDrop: Bool){
       // print(boolDrop)
        if(boolDrop == true)
        {
            print(profileViewModel.profileVCModel[0].data[section].array.count)
            profileViewModel.profileVCModel[0].data[section].isExpandable = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.profileTable.reloadData()
            }
           // self.profileTable.reloadData()
        }
        else{
            profileViewModel.profileVCModel[0].data[section].isExpandable = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.profileTable.reloadData()
            }
            //self.profileTable.reloadData()

        }
    
    }
    
    func setupTableView() {
        self.hideKeyboardWhenTappedAround()
        self.view.addSubview(profileTable)
        profileTable.dataSource = self
        profileTable.delegate = self
        profileTable.backgroundColor = .white
        profileTable.rowHeight = UITableView.automaticDimension
       // profileTable.scrollsToTop = false
        registerCells()
    }
    
    func registerCells(){
      
        let customTableViewCellNib1 = UINib(nibName: "SecondProfileVCTableViewCell", bundle: nil)
           profileTable.register(customTableViewCellNib1, forCellReuseIdentifier: "ProfileView2ndCell")
        
        let customTableViewCellNib = UINib(nibName: "ProfileVCTableViewCell", bundle: nil)
           profileTable.register(customTableViewCellNib, forCellReuseIdentifier: "profileTblCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        //print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
           // print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 1 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        //print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            //print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 2 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        //print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            //print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 3 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
       // print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileCell2Model.count + 2
           // print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 4 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        //print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            //print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 5 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
       // print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
           // print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 6 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        //print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            //print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileViewModel.profileVCModel[0].data.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTable.dequeueReusableCell(withIdentifier: "profileTblCell", for: indexPath) as! ProfileVCTableViewCell
        cell.delegate = self
        cell.editDelegate = self
        cell.saveDelegate = self
        cell.infoTextField.delegate = self
        func textViewDidBeginEditing(_ textView: UITextView) {
            print("Began editing")
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            print("Ended editing")
            if let value = textView.text  {
                 print(value)
            }
        }
       
        if indexPath.section == 0
        {
          //  cell.editDelegate = self
         
            cell.section = indexPath.section
            if indexPath.row == 0 {
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.dropButton.isHidden = false
        
           // self.profileTable.rowHeight = 70.0
            //self.profileTable.rowHeight = UITableView.automaticDimension
            cell.cellHeight.constant = 70.0
           // cell.infoView.isHidden = true
            cell.descriptionBottmConst.isActive = false
            if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
            {
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 2
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                //cell.dropBtn.setImage(UIImage(named: "moveUP"), for: .selected)
                //cell.dropBtn.setBackgroundImage(UIImage(named: "moveUP"), for: .normal)
                
            }
            else{
                //214, 241, 242,
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
               cell.shadowBttmConst.constant = 2
               cell.shadowTopConst.constant = 2
               cell.cellHeight.constant = 70.0
               cell.cellBottomDistConst.constant = 8
               cell.cellTopDistConst.constant = 8
                cell.contView.layer.cornerRadius = 8.0
               self.profileTable.rowHeight = UITableView.automaticDimension
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                cell.dropBtn.setImage(UIImage(named: "dropDown"), for: .normal)
                
            }
            return cell
            }
            if indexPath.row == 1 {
                var edit = cell.editable
                cell.row = indexPath.row
                cell.data  = cell.infoTextField.text
               // print(edit)
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 120.0
            //cell.editBttn.isOpaque = true
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.firstName
                // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                self.profileTable.rowHeight = UITableView.automaticDimension
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
            cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 2 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text =  personalInfo?.middleName //profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 3 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.lastName// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 4 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.bio  // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 5 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = "DD/MM/YYYY"
                     //profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 6 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text =  personalInfo?.designation // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 7 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.department // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 8 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.yearsOfExperience  as? String //"profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 9 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text =  personalInfo?.contactNumber  as? String
                // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 10 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                var edit = cell.editable
               // print(edit)
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = personalInfo?.emailID  // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 11 {
                //cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.section = indexPath.section
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                if cell.editBtn.isHidden == false {
                    cell.cancelBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.editBtn.titleLabel?.text = "Edit Information"
                    cell.editBtn.titleLabel?.textColor = .white
                    //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                }
                else {
                    cell.saveBtn.isHidden = false
                    cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.saveBtn.titleLabel?.text = "Save"
                    cell.saveBtn.titleLabel?.textColor = .white
                    //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    
                    cell.cancelBtn.isHidden = false
                    cell.cancelBtn.backgroundColor = .white
                    cell.cancelBtn.layer.borderWidth = 2.0
                    cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.cancelBtn.titleLabel?.text = "Cancel"
                    cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                  //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                   
                    
                }
                //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.editBtn.titleLabel?.text = "Edit Information"
                //cell.editBtn.titleLabel?.textColor = .white
                ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.shadowBttmConst.constant = 2
                //cell.shadowTopConst.constant = 0
                //cell.cellBottomDistConst.constant = 0
                //cell.cellTopDistConst.constant = 0
                //cell.contView.layer.cornerRadius = 0
                //cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
            }
            
        }
       
        else if indexPath.section == 1 {
         //   cell.editDelegate = self
            cell.row = indexPath.row
            cell.section = indexPath.section
            if indexPath.row == 0 {
                
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.dropButton.isHidden = false
            
               // self.profileTable.rowHeight = 70.0
                //self.profileTable.rowHeight = UITableView.automaticDimension
                cell.cellHeight.constant = 70.0
                //cell.infoView.isHidden = true
                cell.descriptionBottmConst.isActive = false
                if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
                {
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 0
                    cell.shadowTopConst.constant = 2
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    
                }
                else{
                    //214, 241, 242,
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
                   cell.shadowBttmConst.constant = 2
                   cell.shadowTopConst.constant = 2
                   cell.cellHeight.constant = 70.0
                   cell.cellBottomDistConst.constant = 8
                   cell.cellTopDistConst.constant = 8
                    cell.contView.layer.cornerRadius = 8.0
                   self.profileTable.rowHeight = UITableView.automaticDimension
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                }
                return cell
        }
        if indexPath.row == 1 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 100.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text =  skill[0].skill // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 2 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 100.0
            cell.infoTextField.isHidden = false
            cell.titleText.text =  profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text =  skill[1].skill // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 3 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 100.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = skill[2].skill // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 4 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 100.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = skill[3].skill // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 5 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 100.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = skill[4].skill // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 6 {
            cell.row = indexPath.row
            cell.cellHeight.constant = 120.0
           //cell.contView.isHidden = false
            cell.section = indexPath.section
            cell.infoTextField.isHidden = true
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            
           //cell.editBtn.isUserInteractionEnabled = true
            cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            if cell.editBtn.isHidden == false {
                cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.editBtn.titleLabel?.text = "Edit Information"
                cell.editBtn.titleLabel?.textColor = .white
                //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
            }
            else {
                cell.saveBtn.isHidden = false
                cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.saveBtn.titleLabel?.text = "Save"
                cell.saveBtn.titleLabel?.textColor = .white
                //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                
                cell.cancelBtn.isHidden = false
                cell.cancelBtn.backgroundColor = .white
                cell.cancelBtn.layer.borderWidth = 2.0
                cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.cancelBtn.titleLabel?.text = "Cancel"
                cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
              //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
               
                
            }
            //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            //cell.editBtn.titleLabel?.text = "Edit Information"
            //cell.editBtn.titleLabel?.textColor = .white
            ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            //cell.shadowBttmConst.constant = 2
            //cell.shadowTopConst.constant = 0
            //cell.cellBottomDistConst.constant = 0
            //cell.cellTopDistConst.constant = 0
            //cell.contView.layer.cornerRadius = 0
            //cell.titleText.text = ""
            
          //  cell.shadowView.isHidden = true
           // cell.shadowView.isOpaque = true
      
            return cell
        }
            }
      else  if indexPath.section == 2 {
        cell.editDelegate = self
        cell.row = indexPath.row
        cell.section = indexPath.section
        if indexPath.row == 0 {
           // cell.section = indexPath.section
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.dropButton.isHidden = false
        
           // self.profileTable.rowHeight = 70.0
            //self.profileTable.rowHeight = UITableView.automaticDimension
            cell.cellHeight.constant = 70.0
            //cell.infoView.isHidden = true
            cell.descriptionBottmConst.isActive = false
            if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
            {
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 2
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                
            }
            else{
                //214, 241, 242,
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
               cell.shadowBttmConst.constant = 2
               cell.shadowTopConst.constant = 2
               cell.cellHeight.constant = 70.0
               cell.cellBottomDistConst.constant = 8
               cell.cellTopDistConst.constant = 8
                cell.contView.layer.cornerRadius = 8.0
               self.profileTable.rowHeight = UITableView.automaticDimension
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
            }
            return cell
    }
    if indexPath.row == 1 {
        cell.data  = cell.infoTextField.text
        cell.row = indexPath.row
        cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
        cell.cellHeight.constant = 100.0
        cell.infoTextField.isHidden = false
        cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
        cell.infoTextField.text = currProj?.projectName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
        cell.dropButton.isHidden = true
        cell.descriptionBottmConst.isActive = true
        cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowBttmConst.constant = 0
        cell.shadowTopConst.constant = 0
        cell.cellBottomDistConst.constant = 0
        cell.cellTopDistConst.constant = 0
        cell.shadowView.layer.cornerRadius = 0.0
        cell.contView.layer.cornerRadius = 0
        cell.editBtn.isHidden = true
        cell.saveBtn.isHidden = true
        cell.cancelBtn.isHidden = true
        return cell
    }
    else if indexPath.row == 2 {
        cell.data  = cell.infoTextField.text
        cell.row = indexPath.row
        cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
        cell.cellHeight.constant = 100.0
        cell.infoTextField.isHidden = false
        cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
        cell.infoTextField.text = currProj?.reportingManager // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
        cell.dropButton.isHidden = true
        cell.descriptionBottmConst.isActive = true
        cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowBttmConst.constant = 0
        cell.shadowTopConst.constant = 0
        cell.cellBottomDistConst.constant = 0
        cell.cellTopDistConst.constant = 0
        cell.shadowView.layer.cornerRadius = 0.0
        cell.contView.layer.cornerRadius = 0
        cell.editBtn.isHidden = true
        cell.saveBtn.isHidden = true
        cell.cancelBtn.isHidden = true
        return cell
    }
    else if indexPath.row == 3 {
        cell.data  = cell.infoTextField.text
        cell.row = indexPath.row
        cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
        cell.cellHeight.constant = 100.0
        cell.infoTextField.isHidden = false
        cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
        cell.infoTextField.text = currProj!.rolesResp![0] as? String
             // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
        cell.dropButton.isHidden = true
        cell.descriptionBottmConst.isActive = true
        cell.descriptionBottmConst.constant = 0.0
        cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowBttmConst.constant = 0
        cell.shadowTopConst.constant = 0
        cell.cellBottomDistConst.constant = 0
        cell.cellTopDistConst.constant = 0
        cell.shadowView.layer.cornerRadius = 0.0
        cell.contView.layer.cornerRadius = 0
        cell.editBtn.isHidden = true
        cell.saveBtn.isHidden = true
        cell.cancelBtn.isHidden = true
        return cell
    }
    else if indexPath.row == 4 {
        cell.data  = cell.infoTextField.text
        cell.row = indexPath.row
        cell.cellHeight.constant = 120.0
        //cell.contView.isHidden = false
         cell.section = indexPath.section
         cell.infoTextField.isHidden = true
         cell.dropButton.isHidden = true
         cell.descriptionBottmConst.isActive = true
         cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
         cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
         
        //cell.editBtn.isUserInteractionEnabled = true
         cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
         if cell.editBtn.isHidden == false {
             cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             cell.editBtn.titleLabel?.text = "Edit Information"
             cell.editBtn.titleLabel?.textColor = .white
             //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             cell.shadowBttmConst.constant = 2
             cell.shadowTopConst.constant = 0
             cell.cellBottomDistConst.constant = 0
             cell.cellTopDistConst.constant = 0
             cell.contView.layer.cornerRadius = 0
             cell.titleText.text = ""
         }
         else {
             cell.saveBtn.isHidden = false
             cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             cell.saveBtn.titleLabel?.text = "Save"
             cell.saveBtn.titleLabel?.textColor = .white
             //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             
             cell.cancelBtn.isHidden = false
             cell.cancelBtn.backgroundColor = .white
             cell.cancelBtn.layer.borderWidth = 2.0
             cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             cell.cancelBtn.titleLabel?.text = "Cancel"
             cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
           //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
             cell.shadowBttmConst.constant = 2
             cell.shadowTopConst.constant = 0
             cell.cellBottomDistConst.constant = 0
             cell.cellTopDistConst.constant = 0
             cell.contView.layer.cornerRadius = 0
             cell.titleText.text = ""
            
             
         }
         //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
         //cell.editBtn.titleLabel?.text = "Edit Information"
         //cell.editBtn.titleLabel?.textColor = .white
         ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
         //cell.shadowBttmConst.constant = 2
         //cell.shadowTopConst.constant = 0
         //cell.cellBottomDistConst.constant = 0
         //cell.cellTopDistConst.constant = 0
         //cell.contView.layer.cornerRadius = 0
         //cell.titleText.text = ""
         
       //  cell.shadowView.isHidden = true
        // cell.shadowView.isOpaque = true
   
         return cell
     }
        }
        else if indexPath.section == 3 {
            //cell.editDelegate = self
            cell.row = indexPath.row
            cell.section = indexPath.section
            let cell1 =  profileTable.dequeueReusableCell(withIdentifier: "ProfileView2ndCell") as! SecondProfileVCTableViewCell
            if indexPath.row == 0 {
               // cell.section = indexPath.section
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.dropButton.isHidden = false
               // self.profileTable.rowHeight = 70.0
                //self.profileTable.rowHeight = UITableView.automaticDimension
               // cell.cellHeight.constant = 70.0
                //cell.infoView.isHidden = true
                cell.descriptionBottmConst.isActive = false
                if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
                {
                    
                    
                  
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 0
                    cell.shadowTopConst.constant = 2
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    cell.cellHeight.constant = 70.0
                    return cell
                    
                }
                else{
                    //214, 241, 242,
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
                   cell.shadowBttmConst.constant = 2
                   cell.shadowTopConst.constant = 2
                   cell.cellHeight.constant = 70.0
                   cell.cellBottomDistConst.constant = 8
                   cell.cellTopDistConst.constant = 8
                    cell.contView.layer.cornerRadius = 8.0
                   self.profileTable.rowHeight = UITableView.automaticDimension
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    return cell
                }
                //return cell
        }
            else if indexPath.row == 1{
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                //cell1.cellHeight.constant = 216.0
                cell1.organizationNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 2{
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
               // cell1.cellHeight.constant = 216.0
                cell1.organizationNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 3{
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                //cell.cellHeight.constant = 216
               // cell1.cellHeight.constant = 216.0
                cell1.organizationNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 4 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.section = indexPath.section
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                if cell.editBtn.isHidden == false {
                    cell.cancelBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.editBtn.titleLabel?.text = "Edit Information"
                    cell.editBtn.titleLabel?.textColor = .white
                    //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                }
                else {
                    cell.saveBtn.isHidden = false
                    cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.saveBtn.titleLabel?.text = "Save"
                    cell.saveBtn.titleLabel?.textColor = .white
                    //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    
                    cell.cancelBtn.isHidden = false
                    cell.cancelBtn.backgroundColor = .white
                    cell.cancelBtn.layer.borderWidth = 2.0
                    cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.cancelBtn.titleLabel?.text = "Cancel"
                    cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                  //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                   
                    
                }
                //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.editBtn.titleLabel?.text = "Edit Information"
                //cell.editBtn.titleLabel?.textColor = .white
                ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.shadowBttmConst.constant = 2
                //cell.shadowTopConst.constant = 0
                //cell.cellBottomDistConst.constant = 0
                //cell.cellTopDistConst.constant = 0
                //cell.contView.layer.cornerRadius = 0
                //cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
            }
            
        /* else if indexPath.row == 1 {
            //let cell = profileTable.dequeueReusableCell(withIdentifier: "ProfileView2ndCell", for: indexPath) as! SecondProfileVCTableViewCell

           // cell.contView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
            //cell.shadowTrailingConst.constant = 10
            //cell.shadowLeadingConst.constant = 10
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true 
                return cell
            }
            else if indexPath.row == 2 {
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 3 {
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 4  {
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 5 {
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 6 {
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = false
                cell.section = indexPath.section
                cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.editBtn.titleLabel?.text = "Edit Information"
                cell.editBtn.titleLabel?.textColor = .white
                //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
                /*cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                return cell*/
            }
            else if indexPath.row == 6{
                
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = false
                cell.section = indexPath.section
                cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.editBtn.titleLabel?.text = "Edit Information"
                cell.editBtn.titleLabel?.textColor = .white
                //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
            }*/
        }
        else if indexPath.section == 4 {
            cell.editDelegate = self
            cell.section = indexPath.section
            if indexPath.row == 0 {
                cell.row = indexPath.row
               // cell.section = indexPath.section
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.dropButton.isHidden = false
            
               // self.profileTable.rowHeight = 70.0
                //self.profileTable.rowHeight = UITableView.automaticDimension
                cell.cellHeight.constant = 70.0
                //cell.infoView.isHidden = true
                cell.descriptionBottmConst.isActive = false
                if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
                {
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 0
                    cell.shadowTopConst.constant = 2
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    
                }
                else{
                    //214, 241, 242,
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
                   cell.shadowBttmConst.constant = 2
                   cell.shadowTopConst.constant = 2
                   cell.cellHeight.constant = 70.0
                   cell.cellBottomDistConst.constant = 8
                   cell.cellTopDistConst.constant = 8
                    cell.contView.layer.cornerRadius = 8.0
                   self.profileTable.rowHeight = UITableView.automaticDimension
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                }
                return cell
        }
         else if indexPath.row == 1 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 60.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  training[0].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = training[0].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
               cell.saveBtn.isHidden = true
               cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 2 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 60.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = training[1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 3 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 60.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = training[2].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 4  {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 60.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = training[3].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 5 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 60.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = training[4].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 6 {
                cell.row = indexPath.row
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.section = indexPath.section
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                if cell.editBtn.isHidden == false {
                    cell.cancelBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.editBtn.titleLabel?.text = "Edit Information"
                    cell.editBtn.titleLabel?.textColor = .white
                    //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                }
                else {
                    cell.saveBtn.isHidden = false
                    cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.saveBtn.titleLabel?.text = "Save"
                    cell.saveBtn.titleLabel?.textColor = .white
                    //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    
                    cell.cancelBtn.isHidden = false
                    cell.cancelBtn.backgroundColor = .white
                    cell.cancelBtn.layer.borderWidth = 2.0
                    cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.cancelBtn.titleLabel?.text = "Cancel"
                    cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                  //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                   
                    
                }
                //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.editBtn.titleLabel?.text = "Edit Information"
                //cell.editBtn.titleLabel?.textColor = .white
                ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.shadowBttmConst.constant = 2
                //cell.shadowTopConst.constant = 0
                //cell.cellBottomDistConst.constant = 0
                //cell.cellTopDistConst.constant = 0
                //cell.contView.layer.cornerRadius = 0
                //cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
            }
        }
        else if indexPath.section == 5 {
            //cell.editDelegate = self
            cell.section = indexPath.section
            if indexPath.row == 0 {
                cell.row = indexPath.row
                cell.section = indexPath.section
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.dropButton.isHidden = false
            
               // self.profileTable.rowHeight = 70.0
                //self.profileTable.rowHeight = UITableView.automaticDimension
                cell.cellHeight.constant = 70.0
                //cell.infoView.isHidden = true
                cell.descriptionBottmConst.isActive = false
                if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
                {
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 0
                    cell.shadowTopConst.constant = 2
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                }
                else{
                    //214, 241, 242,
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
                   cell.shadowBttmConst.constant = 2
                   cell.shadowTopConst.constant = 2
                   cell.cellHeight.constant = 70.0
                   cell.cellBottomDistConst.constant = 8
                   cell.cellTopDistConst.constant = 8
                    cell.contView.layer.cornerRadius = 8.0
                   self.profileTable.rowHeight = UITableView.automaticDimension
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                }
                return cell
        }
         else if indexPath.row == 1 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
           // cell.contView.backgroundColor =  UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
            cell.titleText.text =  profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text =  academicInfo[0].course // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 2 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = academicInfo[0].specialization // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 3 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = academicInfo[1].course // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 4 {
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = academicInfo[1].specialization // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 0
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.shadowView.layer.cornerRadius = 0.0
                cell.contView.layer.cornerRadius = 0
                cell.editBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                return cell
            }
            else if indexPath.row == 5 {
                
                cell.row = indexPath.row
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.section = indexPath.section
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                if cell.editBtn.isHidden == false {
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.editBtn.titleLabel?.text = "Edit Information"
                    cell.editBtn.titleLabel?.textColor = .white
                    //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                }
                else {
                    cell.saveBtn.isHidden = false
                    cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.saveBtn.titleLabel?.text = "Save"
                    cell.saveBtn.titleLabel?.textColor = .white
                    //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    
                    cell.cancelBtn.isHidden = false
                    cell.cancelBtn.backgroundColor = .white
                    cell.cancelBtn.layer.borderWidth = 2.0
                    cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.cancelBtn.titleLabel?.text = "Cancel"
                    cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                  //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 2
                    cell.shadowTopConst.constant = 0
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.titleText.text = ""
                   
                    
                }
                //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.editBtn.titleLabel?.text = "Edit Information"
                //cell.editBtn.titleLabel?.textColor = .white
                ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                //cell.shadowBttmConst.constant = 2
                //cell.shadowTopConst.constant = 0
                //cell.cellBottomDistConst.constant = 0
                //cell.cellTopDistConst.constant = 0
                //cell.contView.layer.cornerRadius = 0
                //cell.titleText.text = ""
                
              //  cell.shadowView.isHidden = true
               // cell.shadowView.isOpaque = true
          
                return cell
            }
            
        }
        else if indexPath.section == 6 {
           // cell.editDelegate = self
            
            cell.section = indexPath.section
            if indexPath.row == 0 {
                cell.row = indexPath.row
                //cell.section = indexPath.section
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.dropButton.isHidden = false
            
               // self.profileTable.rowHeight = 70.0
                //self.profileTable.rowHeight = UITableView.automaticDimension
                cell.cellHeight.constant = 70.0
                //cell.infoView.isHidden = true
                cell.descriptionBottmConst.isActive = false
                if profileViewModel.profileVCModel[0].data[indexPath.section].isExpandable == true
                {
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                    cell.shadowBttmConst.constant = 0
                    cell.shadowTopConst.constant = 2
                    cell.cellBottomDistConst.constant = 0
                    cell.cellTopDistConst.constant = 0
                    cell.contView.layer.cornerRadius = 0
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                    
                }
                else{
                    //214, 241, 242,
                    cell.shadowView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
                   cell.shadowBttmConst.constant = 2
                   cell.shadowTopConst.constant = 2
                   cell.cellHeight.constant = 70.0
                   cell.cellBottomDistConst.constant = 8
                   cell.cellTopDistConst.constant = 8
                    cell.contView.layer.cornerRadius = 8.0
                   self.profileTable.rowHeight = UITableView.automaticDimension
                    cell.editBtn.isHidden = true
                    cell.saveBtn.isHidden = true
                    cell.cancelBtn.isHidden = true
                }
                return cell
        }
        if indexPath.row == 1 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 2 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 3 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = interest_Hobbies[indexPath.row - 1].interestName // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 4  {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = interest_Hobbies[indexPath.row - 1].interestName // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 5 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = interest_Hobbies[indexPath.row - 1].interestName // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 6 {
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text =  interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = false
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowBttmConst.constant = 0
            cell.shadowTopConst.constant = 0
            cell.cellBottomDistConst.constant = 0
            cell.cellTopDistConst.constant = 0
            cell.shadowView.layer.cornerRadius = 0.0
            cell.contView.layer.cornerRadius = 0
            cell.editBtn.isHidden = true
            cell.saveBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            return cell
        }
        else if indexPath.row == 7 {
            cell.row = indexPath.row
            cell.cellHeight.constant = 120.0
           //cell.contView.isHidden = false
            cell.section = indexPath.section
            cell.infoTextField.isHidden = true
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            
           //cell.editBtn.isUserInteractionEnabled = true
            cell.editBtn.isHidden = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            if cell.editBtn.isHidden == false {
                cell.saveBtn.isHidden = true
                cell.cancelBtn.isHidden = true
                cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.editBtn.titleLabel?.text = "Edit Information"
                cell.editBtn.titleLabel?.textColor = .white
                //cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
            }
            else {
                cell.saveBtn.isHidden = false
                cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.saveBtn.titleLabel?.text = "Save"
                cell.saveBtn.titleLabel?.textColor = .white
                //cell.saveBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                
                cell.cancelBtn.isHidden = false
                cell.cancelBtn.backgroundColor = .white
                cell.cancelBtn.layer.borderWidth = 2.0
                cell.cancelBtn.layer.borderColor = CGColor(red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.cancelBtn.titleLabel?.text = "Cancel"
                cell.cancelBtn.titleLabel?.textColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
              //  cell.cancelBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
                cell.shadowBttmConst.constant = 2
                cell.shadowTopConst.constant = 0
                cell.cellBottomDistConst.constant = 0
                cell.cellTopDistConst.constant = 0
                cell.contView.layer.cornerRadius = 0
                cell.titleText.text = ""
               
                
            }
            //cell.editBtn.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            //cell.editBtn.titleLabel?.text = "Edit Information"
            //cell.editBtn.titleLabel?.textColor = .white
            ////cell.editBtnLabel.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            //cell.shadowBttmConst.constant = 2
            //cell.shadowTopConst.constant = 0
            //cell.cellBottomDistConst.constant = 0
            //cell.cellTopDistConst.constant = 0
            //cell.contView.layer.cornerRadius = 0
            //cell.titleText.text = ""
            
          //  cell.shadowView.isHidden = true
           // cell.shadowView.isOpaque = true
      
            return cell
        }
        }
     
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
}
public extension UITableView {
  func indexPathForView(_ view: UIView) -> IndexPath? {
    let origin = view.bounds.origin
    let viewOrigin = self.convert(origin, from: view)
    let indexPath = self.indexPathForRow(at: viewOrigin)
    return indexPath
  }
}


