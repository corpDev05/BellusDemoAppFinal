//
//  ProfileVCTableViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit


class ProfileVCTableViewCell: UITableViewCell , UITextViewDelegate{
    @IBOutlet var cellTopDistConst: NSLayoutConstraint!
    
  
    @IBOutlet var cellBottomDistConst: NSLayoutConstraint!
    
    @IBOutlet var shadowTopConst: NSLayoutConstraint!
    
    @IBOutlet var cellbtnHeight: NSLayoutConstraint!
    
    @IBOutlet var cellBtnWidth: NSLayoutConstraint!
    @IBOutlet var shadowBttmConst: NSLayoutConstraint!
    
    @IBOutlet var cellBtn: UIButton!
    
    @IBOutlet var shadowView: UIView!
    @IBOutlet var contView: UIView!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var infoView: UITextField!
    @IBOutlet var cellHeight : NSLayoutConstraint!
    @IBOutlet var descriptionBottmConst : NSLayoutConstraint!
    @IBOutlet var saveBtn: UIButton!
    
    @IBOutlet var cancelBtn: UIButton!
    
    @IBOutlet var editBtn: UIButton!
    
    @IBOutlet var titleText: UILabel!
    
    @IBOutlet var  dropButton: UIButton!
    
    @IBOutlet var  infoTextField: UITextView!
    
    @IBOutlet var dropBtn: UIButton!
    
    @IBOutlet var shadowTrailingConst: NSLayoutConstraint!
    
    @IBOutlet var shadowLeadingConst: NSLayoutConstraint!
    
    
    var editable = false
    var drop  = false
    var  profileViewModel : ProfileViewModel = ProfileViewModel()
    var delegate : ProfileTVCellDelegate?
    var editDelegate : ProfileVCCellEditDelegate?
    var section : Int = 0
    var row : Int = 0
    var data : String?
    var index : NSIndexPath?
    var saveDelegate : ProfileCellSaveBtnClkDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        infoTextField.delegate = self
        // Initialization code
        //shadowView.isHidden = true
       setUp()

    }
    
    //func textViewDidBeginEditing(_ textView: UITextView) {
     //   debugPrint("Began Editing")
    //}
    //func textViewDidEndEditing(_ textView: UITextView) {
    //    debugPrint("Ended Editing")
    //}
    /*func textViewDidEndEditing(_ textView: UITextView) {
            index = NSIndexPath(row: textView.tag, section: section)
           }*/
   
    func setUp(){
     
        shadowView.layer.cornerRadius = 8.0
        contView.layer.cornerRadius = 8.0
        cancelBtn.isHidden = true
        saveBtn.isHidden = true
        
        //tblBotmCost.isActive = false
        //innerViewBotmCost.isActive = false
    }

    
    @IBAction func editBtnTap(_ sender: Any) {
        editable.toggle()
        //editable = editable == true ? false : true
       var edit = editable
        print("editable is \(edit)")
        self.editDelegate?.isEditable(section ,true)
        
        
    }
    
    
    @IBAction func dropDownClk(_ sender : AnyObject){
        drop.toggle()
        print("drop is \(drop)")
       // weak var delegate : ProfileTVCellDelegate?
        delegate?.profileTVCell(section,drop)
    }
    
  
    @IBAction func SaveBtnTap(_ sender: Any) {
       // editable.toggle()
       // editable = editable == true ? false : true
        var flag = editable
        print("save is \(flag)")
        print("editable is \(editable)")
        self.editDelegate?.isEditable(section,false)
        print("Row is \(row),and Coloumn is \(section)")
        let data = infoTextField.text
        debugPrint(" data is \(data)")
        saveDelegate?.saveBtnClked(section, row, data)
        
        //Call textfield Did end editing
        //Create a protocol for saving the entered data in the correct section/row of the table core data.
        //Make the function to save the input in the core data
        //After all is done add a UIALert to confirm changing data/saving data
        
    }
    
    @IBAction func CancelBtnTap(_ sender: Any) {
        editable.toggle()
       // editable = editable == true ? false : true
        var flag = editable
        print("cancel is \(flag)")
        print("editable is \(editable)")
        self.editDelegate?.isEditable(section, false)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
