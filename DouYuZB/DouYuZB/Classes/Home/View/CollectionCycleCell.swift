//
//  CollectionCycleCell.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var cycleModel :CycleModel?{
        didSet{
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")
            
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "live_cell_default_phone"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
}
