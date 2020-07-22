//
//  CollectionPrettyCell.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit
import Kingfisher


class CollectionPrettyCell: CollectionBaseCell {

    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor: AnchorModel?{
        didSet{
            cityBtn.setTitle(anchor?.anchor_city, for: [])
            
        }
    }
   

    
    
    

}
