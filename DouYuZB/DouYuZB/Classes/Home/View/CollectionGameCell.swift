//
//  CollectionGameCell.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    var group : AnchorGroup?{
        didSet{
            
            
            titleLabel.text = group?.tag_name
            let iconURL = URL(string: group?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconURL,placeholder: UIImage(named: "home_more_btn"))
        }
    }
    
    override func awakeFromNib() {
        iconImageView.layer.cornerRadius = 22.5
        iconImageView.layer.masksToBounds = true
    }
    

}
