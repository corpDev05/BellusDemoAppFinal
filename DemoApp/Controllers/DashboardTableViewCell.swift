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
  //  @IBOutlet var postView: UIView!
    @IBOutlet var tblPostView: UIView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userDesignation: UILabel!
    @IBOutlet var uploadedImage: UIImageView!
    @IBOutlet var postLabel: UILabel!
    
    @IBOutlet var timeOfPost: UILabel!
    @IBOutlet var dateOfPost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // tblView.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        tblPostView.layer.cornerRadius = 12.0
        // Configure the view for the selected state
    }
    
    func setupCell(viewModel: DashboardTblCellViewModel){
          self.userName.text = viewModel.title
          self.userDesignation.text  = viewModel.rating
          self.postLabel.text = viewModel.overview
         // self.uploadedImage.sd_setImage(with: viewModel.imageUrl, completed: nil)
          //self.uploadedImage.sd_setImage(with: viewModel.imageUrl, completed: nil)
          
      }


    
}
