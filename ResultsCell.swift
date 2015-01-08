//
//  ResultsCell.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-06.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let theWidth = UIScreen.mainScreen().bounds.width
        
        contentView.frame = CGRectMake(0, 0, theWidth, 120)
        profileImage.center = CGPointMake(60, 60)
        profileNameLabel.center = CGPointMake(230, 55)
        profileImage.layer.cornerRadius = 50.0
        profileImage.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
