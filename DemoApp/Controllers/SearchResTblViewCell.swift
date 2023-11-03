//
//  SearchResTblViewCell.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 27/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import UIKit

class SearchResTblViewCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var shadowView: UIView!
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var resultName: UILabel!
    
    @IBOutlet var resultDesignation: UILabel!
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 8.0
        shadowView.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
