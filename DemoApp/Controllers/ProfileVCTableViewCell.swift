//
//  ProfileVCTableViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 06/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class ProfileVCTableViewCell: UITableViewCell {

    @IBOutlet var shadowView: UIView!
    
    @IBOutlet var contView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //shadowView.isHidden = true
        shadowView.layer.cornerRadius = 8.0
        contView.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
