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
    func saveBtnClked(_ section: Int, _ row: Int, _ data: Any) {
        debugPrint("section is \(section) , row is \(row) , data is \(data)")
        let sec = section
        let rw = row
        let dt = data as? String
        switch section {
        
        case 0 :
            do {
                var record = personalInfoManager.getAllRecord()
                switch row {
               
            case 1 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].firstName = data as? String
                    personalInfo?.firstName  = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].middleName = data as? String
                    personalInfo?.middleName  = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 3 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].lastName = data as? String
                    personalInfo?.lastName   = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].bio = data as? String
                    personalInfo?.bio   = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 5 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].dateOfBirth = data as? Date
                    personalInfo?.dateOfBirth   = data as? Date
                    PersistentStorage.shared.saveContext()
                }
            case 6 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].designation = data as? String
                    personalInfo?.designation    = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 7 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].department = data as? String
                    personalInfo?.department   = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 8 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].yearsOfExperience = (data as? Int16) ?? 1
                    personalInfo?.yearsOfExperience = (data as? Int16) ?? 1
                    PersistentStorage.shared.saveContext()
                }
            case 9 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].contactNumber = (data as? Int64) ?? 7239239024
                    personalInfo?.contactNumber = (data as? Int64) ?? 7239239024
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
            var record = skillSetManager.getAllRecord()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record[0].skill = data as? String
                    skill[0].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[1].skill = data as? String
                    skill[1].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[2].skill = data as? String
                    skill[2].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4:
                do {
                    guard record != nil else{ return }
                    record[3].skill = data as? String
                    skill[3].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 5:
                do {
                    guard record != nil else{ return }
                    record[4].skill = data as? String
                    skill[4].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }
      /*  case 2 : do {
            var record = currentProjectManager.getAllRecord()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record[0].skill = data as? String
                    skill[0].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[1].skill = data as? String
                    skill[1].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[2].skill = data as? String
                    skill[2].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4:
                do {
                    guard record != nil else{ return }
                    record[3].skill = data as? String
                    skill[3].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 5:
                do {
                    guard record != nil else{ return }
                    record[4].skill = data as? String
                    skill[4].skill = data as? String
                    PersistentStorage.shared.saveContext()
                }
            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }*/
        case 2 : do {
            var record = currentProjectManager.getAllRecord()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record[0].projectName = data as? String
                    currProj?.projectName = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[1].reportingManager = data as? String
                    currProj?.reportingManager = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[2].rolesResp?[0] = data as! NSString
                    currProj?.rolesResp?[0] = data as! NSString
                    debugPrint("roles are \(currProj?.rolesResp)")
                    PersistentStorage.shared.saveContext()
                }
            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }
        case 3 :
            do {
                var record = previousExperienceManager.getAllRecord()
                switch row {
               
            case 1 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].name = data as? String
                    prevExp[0].name   = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].organisation = data as? String
                    prevExp[0].organisation  = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 3 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[0].roleRespons?[0]  = data as? NSString ?? "Edit and Enter the value again"
                    prevExp[0].roleRespons?[0]   = data as? NSString ?? "Edit and Enter the value again"
                    PersistentStorage.shared.saveContext()
                }
            case 4 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[1].name = data as? String
                    prevExp[1].name   = data as? String
                    PersistentStorage.shared.saveContext()
                }
                
            case 5 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[1].organisation = data as? String
                    prevExp[1].organisation    = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 6 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[1].roleRespons![0] = data as? String as! NSString
                    prevExp[1].roleRespons![0] = data as? String as! NSString
                    PersistentStorage.shared.saveContext()
                }
            case 7 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[2].name = data as? String
                    prevExp[2].name    = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 8 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[2].organisation = data as? String
                    prevExp[2].organisation = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 9 :
                do {
                    guard record != nil else {
                        return
                    }
                    record[2].roleRespons?[0] = data as? NSString ?? "Edit and Enter Again"
                    prevExp[2].roleRespons?[0] = data as? NSString ?? "Edit and Enter Again"
                    //personalInfo?.contactNumber = (data as? Int64) ?? 7239239024
                    PersistentStorage.shared.saveContext()
                }
             
            default:
                debugPrint("Error")
            }
                 let indexSet = IndexSet(integer: section)
                profileTable.reloadSections(indexSet, with: .none)
            }
        case 4 : do {
            var record = training_certificateManager.getAllRecord()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record[0].nameOfTraining = data as? String
                    training[0].nameOfTraining = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[1].nameOfTraining = data as? String
                    training[1].nameOfTraining = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[2].nameOfTraining = data as? String
                    training[2].nameOfTraining = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4:
                    do {
                        guard record != nil else{ return }
                        record[3].nameOfTraining = data as? String
                        training[3].nameOfTraining = data as? String
                        PersistentStorage.shared.saveContext()
                    }
            case 5:
                    do {
                        guard record != nil else{ return }
                        record[4].nameOfTraining = data as? String
                        training[4].nameOfTraining = data as? String
                        PersistentStorage.shared.saveContext()
                    }
            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }
        case 5 : do {
            var record = academicInfoManager.getAllRecord()
            debugPrint("record count in acad info is \(record.count)")
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    debugPrint("record count in acad info is \(record.count)")
                    record[0].course = data as? String
                    academicInfo[0].course = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[0].specialization = data as? String
                    academicInfo[0].specialization = data as? String
                    PersistentStorage.shared.saveContext()
                    
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[1].course = data as? String
                    academicInfo[1].course = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4:
                    do {
                        guard record != nil else{ return }
                        record[1].specialization = data as? String
                        academicInfo[1].specialization = data as? String
                        PersistentStorage.shared.saveContext()
                    }

            default:
                debugPrint("Error in Saving changes to Core Data")
            }
        }
        case 6 : do {
            var record = interest_HobbiesManager.getAllRecord()
            switch row {
            case 1:
                do {
                    guard record != nil else{ return }
                    record[0].interestName = data as? String
                    interest_Hobbies[0].interestName = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 2:
                do {
                    guard record != nil else{ return }
                    record[1].interestName = data as? String
                    interest_Hobbies[1].interestName = data as? String
                    PersistentStorage.shared.saveContext()
                    
                }
            case 3:
                do {
                    guard record != nil else{ return }
                    record[2].interestName = data as? String
                    interest_Hobbies[2].interestName = data as? String
                    PersistentStorage.shared.saveContext()
                }
            case 4:
                    do {
                        guard record != nil else{ return }
                        record[3].interestName = data as? String
                        interest_Hobbies[3].interestName = data as? String
                        PersistentStorage.shared.saveContext()
                    }
            case 5:
                    do {
                        guard record != nil else{ return }
                        record[4].interestName = data as? String
                        interest_Hobbies[4].interestName = data as? String
                        PersistentStorage.shared.saveContext()
                    }
            case 6:
                    do {
                        guard record != nil else{ return }
                        record[5].interestName = data as? String
                        interest_Hobbies[5].interestName = data as? String
                        PersistentStorage.shared.saveContext()
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
            if !(profileViewModel.profileVCModel[0].data[section].isEditable ?? false) {
            var count =  profileViewModel.profileCell2Model.count + 2
           // print(count)
            return count
            }
            else{
                var count = prevExp.count * 3 + 2
                return count
            }
            
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
        ///func textViewDidBeginEditing(_ textView: UITextView) {//
        //    print("Began editing")
        //}
        //func textViewDidEndEditing(_ textView: UITextView) {
        //    print("Ended editing")
        //    if let value = textView.text  {
        //         print(value)
        //    }
        //}
       
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
                section = indexPath.section
                var edit = cell.editable
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
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
        section = indexPath.section
        cell.infoTextField.tag = indexPath.row
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
        section = indexPath.section
        cell.infoTextField.tag = indexPath.row
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
        section = indexPath.section
        cell.infoTextField.tag = indexPath.row
        cell.data  = cell.infoTextField.text
        cell.row = indexPath.row
        cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
        cell.cellHeight.constant = 100.0
        cell.infoTextField.isHidden = false
        cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
        debugPrint(currProj?.rolesResp?[0] as? String ?? "nil")
        cell.infoTextField.text = currProj?.rolesResp![0] as? String ?? "UI Design"
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
        section = indexPath.section
        //cell.infoTextField.tag = indexPath.row
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
               cell.section = indexPath.section
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
            if !(profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false) {
            
             if indexPath.row == 1 {
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                
                self.section = indexPath.section
                 //
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.cellHeight.constant = 216.0
                
                cell1.organizationNameLbl.text = prevExp[indexPath.row - 1].organisation // profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = prevExp[indexPath.row - 1].name // profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = prevExp[indexPath.row - 1].roleRespons?[0] as? String // profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 2{
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
               // cell1.cellHeight.constant = 216.0
                cell1.organizationNameLbl.text = prevExp[indexPath.row - 1].organisation // profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = prevExp[indexPath.row - 1].name // profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = prevExp[indexPath.row - 1].roleRespons?[0] as? String // profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 3{
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell1.borderCell.layer.borderWidth = 2.0
                cell1.borderCell.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                //cell.cellHeight.constant = 216
               // cell1.cellHeight.constant = 216.0
               // cell.titleText.text = "Name"
                //cell.infoTextField.text = prevExp[indexPath.row - 1].organisation
                 // profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = prevExp[indexPath.row - 1].name // profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = prevExp[indexPath.row - 1].roleRespons?[0] as? String // profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                cell1.organizationNameLbl.text = prevExp[indexPath.row - 1].organisation // profileViewModel.profileCell2Model[indexPath.row-1].orgName
                cell1.projectNameLbl.text = prevExp[indexPath.row - 1].name // profileViewModel.profileCell2Model[indexPath.row-1].pojectName
                cell1.rolesAndResponsLbl.text = prevExp[indexPath.row - 1].roleRespons?[0] as? String // profileViewModel.profileCell2Model[indexPath.row-1].rolesAndResponsibilities[0]
                return cell1
                
            }
            else if indexPath.row == 4 {
                self.section = indexPath.section
               // cell.infoTextField.tag = indexPath.row
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
            }
            else {
                
            if indexPath.row == 1 {
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
            //let cell = profileTable.dequeueReusableCell(withIdentifier: "ProfileView2ndCell", for: indexPath) as! SecondProfileVCTableViewCell

           // cell.contView.backgroundColor = UIColor(displayP3Red: 214/255, green: 241/255, blue: 242/255, alpha: 1.0)
            //cell.shadowTrailingConst.constant = 10
            //cell.shadowLeadingConst.constant = 10
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  "Name" //prevExp[0].name  // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[0].name ?? "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =   "Organisation" //prevExp[0].organisation // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[0].organisation ?? "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  "Roles and Responsibilities" // prevExp[0].roleRespons?[0] as String? // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[0].roleRespons?[0]  as String? ??  "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = "Name"   //prevExp[1].name  // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[1].name ?? "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =   "Organization"  //prevExp[1].organisation // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[1].organisation ?? ""// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = "Roles and Responsibilities"  // prevExp[1].roleRespons![0] as? String // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[1].roleRespons![0] as? String ?? ""// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            else if indexPath.row == 7 {
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  "Name"    //prevExp[2].name // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[2].name ?? ""// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            else if indexPath.row == 8 {
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =   "Organization" //prevExp[2].organisation // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[2].organisation ?? ""// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            else if indexPath.row == 9 {
                self.section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.cancelBtn.isHidden = true
                cell.saveBtn.isHidden = true

                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text =  "Roles and Resposibilities" // prevExp[2].roleRespons![0] as String // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = prevExp[2].roleRespons![0] as String ?? ""// profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            else if indexPath.row == 10{
                //cell.cancelBtn.isHidden = false
                self.section = indexPath.section
               // cell.infoTextField.tag = indexPath.row
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
                return cell
            }
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
                    cell.descriptionBottmConst.isActive = true
                    
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
                    //cell.descriptionBottmConst.isActive = false
                }
                return cell
        }
         else if indexPath.row == 1 {
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
                cell.infoTextField.isHidden = false
            cell.titleText.text =  training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = ""//training[0].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant =  cell.infoTextField.isEditable ? 120 : 60
                cell.infoTextField.isHidden = false
                cell.titleText.text =  training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = "" //training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
                cell.infoTextField.isHidden = false
                cell.titleText.text = training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = "" //training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
                cell.infoTextField.isHidden = false
                cell.titleText.text = training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text =  ""//training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
                cell.data  = cell.infoTextField.text
                cell.row = indexPath.row
                cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
                cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
                cell.infoTextField.isHidden = false
                cell.titleText.text =  training[indexPath.row - 1].nameOfTraining // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = ""
                // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
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
                cell.infoTextField.tag = indexPath.row
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
                //cell.infoTextField.tag = indexPath.row
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
                cell.infoTextField.tag = indexPath.row
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
                section = indexPath.section
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            //cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            //cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = "" // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            //cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = "" // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
           // cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = "" // // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
            //cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
            cell.infoTextField.tag = indexPath.row
            cell.data  = cell.infoTextField.text
            cell.row = indexPath.row
            cell.infoTextField.isEditable = profileViewModel.profileVCModel[0].data[indexPath.section].isEditable ?? false
            cell.cellHeight.constant = cell.infoTextField.isEditable ? 120 : 60
            cell.descriptionBottmConst.isActive = cell.infoTextField.isEditable
            cell.infoTextField.isHidden = false
            cell.titleText.text = interest_Hobbies[indexPath.row - 1].interestName // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text =  "" // profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
            cell.dropButton.isHidden = true
           // cell.descriptionBottmConst.isActive = false
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
            section = indexPath.section
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
     func textViewDidEndEditing(_ textView: UITextView) {
            let index = NSIndexPath(row: textView.tag, section: section)
        debugPrint("row is \(index.row) and section is \(index.section) and the data is \(textView.text)")
        saveBtnClked(index.section,index.row , textView.text)
            if let cell = profileTable.cellForRow(at: index as IndexPath)as? ProfileVCTableViewCell {
              
                  //  dataModel[textField.tag].firstTextFieldData = textField.text
                    //dataModel[textField.tag].secondTextFieldData = textField.text
                }
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


//let queue = DispatchQueue(label: "Withrawal Queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: .none)

//queue.async {
//    <#code#>
//}
