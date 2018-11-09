//
//  RepositoryTableViewCell.swift
//  GetGitHub
//
//  Created by Leonardo Henrique on 14/01/16.
//  Copyright © 2016 leonardo. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var qtdeForks: UILabel!
    @IBOutlet weak var qtdeStars: UILabel!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var branchType: UILabel!
    @IBOutlet weak var language: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
