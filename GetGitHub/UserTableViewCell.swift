//
//  UserTableViewCell.swift
//  GetGitHub
//
//  Created by Leonardo Henrique on 14/01/16.
//  Copyright © 2016 leonardo. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
