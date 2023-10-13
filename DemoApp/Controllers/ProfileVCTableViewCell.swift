//
//  ProfileVCTableViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit


class ProfileVCTableViewCell: UITableViewCell {
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
    
    
    @IBOutlet var editBtn: UIButton!
    
    @IBOutlet var titleText: UILabel!
    
    @IBOutlet var  dropButton: UIButton!
    
    @IBOutlet var  infoTextField: UITextView!
    

    
    

    var drop  = false
    var  profileViewModel : ProfileViewModel = ProfileViewModel()
    var delegate : ProfileTVCellDelegate?
    var section : Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //shadowView.isHidden = true
       setUp()
        
    }
   
    func setUp(){
     
        shadowView.layer.cornerRadius = 8.0
        contView.layer.cornerRadius = 8.0
        
        //tblBotmCost.isActive = false
        //innerViewBotmCost.isActive = false
    }

    
    
    @IBAction func dropDownClk(_ sender : AnyObject){
        drop.toggle()
        print(drop)
       // weak var delegate : ProfileTVCellDelegate?
        delegate?.profileTVCell(section,drop)
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
