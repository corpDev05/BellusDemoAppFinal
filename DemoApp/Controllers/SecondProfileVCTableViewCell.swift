//
//  SecondProfileVCTableViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 16/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class SecondProfileVCTableViewCell: UITableViewCell {
    public static var identifier : String {
        get {
            return "ProfileView2ndCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "ProfileView2ndCell" , bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
