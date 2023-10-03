//
//  DashboardTableViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 03/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    @IBOutlet var tblView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // tblView.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
