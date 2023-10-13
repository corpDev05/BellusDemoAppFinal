//
//  File.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewVC : UITableViewDelegate,UITableViewDataSource{
    func profileTVCell(_ section : Int, _ boolDrop: Bool){
        print(boolDrop)
        if(boolDrop == true)
        {
            print(profileViewModel.profileVCModel[0].data[section].array.count)
            profileViewModel.profileVCModel[0].data[section].isExpandable = true
          //  profileViewModel.profileCellModel[0].isExpandable = true
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
        self.view.addSubview(profileTable)
        profileTable.dataSource = self
        profileTable.delegate = self
        profileTable.backgroundColor = .white
        profileTable.rowHeight = UITableView.automaticDimension
       // profileTable.scrollsToTop = false
        registerCells()
    }
    
    func registerCells(){
        let customTableViewCellNib = UINib(nibName: "ProfileVCTableViewCell", bundle: nil)
           profileTable.register(customTableViewCellNib, forCellReuseIdentifier: "profileTblCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 1 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 2 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 3 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 4 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 5 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
            return count
        }
        else
        {
            return 1
          }
        }
        if section == 6 {
            var obj = profileViewModel.profileVCModel[0].data[section].isExpandable
        print(obj)
        if obj == true
        {
            var count =  profileViewModel.profileVCModel[0].data[section].array.count
            print(count)
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
       // var count = profileViewModel.profileVCModel[0].data.count
        //print(count)
        return profileViewModel.profileVCModel[0].data.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTable.dequeueReusableCell(withIdentifier: "profileTblCell", for: indexPath) as! ProfileVCTableViewCell
        cell.delegate = self
       
        
        if indexPath.section == 0
        {
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
            }
            return cell
            }
            if indexPath.row == 1 {
            cell.cellHeight.constant = 120.0
            //cell.editBttn.isOpaque = true
           
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
               cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 2 {
                cell.cellHeight.constant = 120.0
                cell.titleText.text = profileViewModel.profileCellModel[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
                cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 3 {
                cell.cellHeight.constant = 120.0
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
                cell.infoTextField.isHidden = false
                return cell
            }
            else if indexPath.row == 4  {
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileCellModel[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            else if indexPath.row == 7  {
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            else if indexPath.row == 8  {
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            else if indexPath.row == 9  {
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            else if indexPath.row == 10  {
                cell.cellHeight.constant = 120.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].placeholder
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
            else if indexPath.row == 11{
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = true
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = false
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
            }
            
        }
       
        else if indexPath.section == 1 /*|| indexPath.row == 12*/ {
            
            if indexPath.row == 0 {
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
                }
                return cell
        }
        if indexPath.row == 1 {
 
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
        }
            }
      else  if indexPath.section == 2 /*|| indexPath.row == 13*/ {
        if indexPath.row == 0 {
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
            }
            return cell
    }
    if indexPath.row == 1 {

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
       
        cell.cellHeight.constant = 100.0
        cell.infoTextField.isHidden = false
        cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
        cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
        return cell
    }
    else if indexPath.row == 4 {
        
        cell.cellHeight.constant = 120.0
       //cell.contView.isHidden = false
        cell.infoTextField.isHidden = true
        cell.dropButton.isHidden = true
        cell.descriptionBottmConst.isActive = true
        cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
        
       //cell.editBtn.isUserInteractionEnabled = true
        cell.editBtn.isHidden = false
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
    }
        }
        else if indexPath.section == 3 /*|| indexPath.row == 14*/ {
            if indexPath.row == 0 {
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
                }
                return cell
        }
         else if indexPath.row == 1 {
     
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
            }
        }
        else if indexPath.section == 4 /*|| indexPath.row == 15*/ {
            if indexPath.row == 0 {
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
                }
                return cell
        }
         else if indexPath.row == 1 {
     
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                return cell
            }
            else if indexPath.row == 2 {
               
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                return cell
            }
            else if indexPath.row == 3 {
               
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                return cell
            }
            else if indexPath.row == 4  {
               
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                return cell
            }
            else if indexPath.row == 5 {
                
                cell.cellHeight.constant = 100.0
                cell.infoTextField.isHidden = false
                cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
                cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
                return cell
            }
            else if indexPath.row == 6 {
                
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = false
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
            }
        }
        else if indexPath.section == 5 /*|| indexPath.row == 16*/ {
            if indexPath.row == 0 {
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
                }
                return cell
        }
         else if indexPath.row == 1 {
                
           // cell.contView.backgroundColor =  UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
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
                
                cell.cellHeight.constant = 120.0
               //cell.contView.isHidden = false
                cell.infoTextField.isHidden = true
                cell.dropButton.isHidden = true
                cell.descriptionBottmConst.isActive = false
                cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
                
               //cell.editBtn.isUserInteractionEnabled = true
                cell.editBtn.isHidden = false
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
            }
            
        }
        else if indexPath.section == 6 /*|| indexPath.row == 17*/ {
            if indexPath.row == 0 {
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
                }
                return cell
        }
        if indexPath.row == 1 {
 
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 2 {
           
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 3 {
           
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 4  {
           
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 5 {
            
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 6 {
            
            cell.cellHeight.constant = 60.0
            cell.infoTextField.isHidden = false
            cell.titleText.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].title
            cell.infoTextField.text = profileViewModel.profileVCModel[0].data[indexPath.section].array[indexPath.row].description
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
            return cell
        }
        else if indexPath.row == 7 {
            
            cell.cellHeight.constant = 120.0
           //cell.contView.isHidden = false
            cell.infoTextField.isHidden = true
            cell.dropButton.isHidden = true
            cell.descriptionBottmConst.isActive = true
            cell.shadowView.backgroundColor = UIColor(displayP3Red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            cell.shadowView.layer.borderColor = CGColor(red: 17/255, green: 180/255, blue: 189/255, alpha: 1.0)
            
           //cell.editBtn.isUserInteractionEnabled = true
            cell.editBtn.isHidden = false
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
        }
        }
      /*  else if indexPath.row == 12 {
            //9, 96, 123,
            //cell.shadowView.backgroundColor = UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            //cell.cellBtn.backgroundColor =  UIColor(displayP3Red: 9/255, green: 96/255, blue: 123/255, alpha: 1.0)
            cell.shadowView.isHidden = true
            cell.shadowView.isOpaque = true
            cell.cellbtnHeight.constant = 60.0
            cell.cellBtnWidth.constant = 300.0
            return cell
        }*/
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
}


