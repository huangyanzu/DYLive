//
//  CollectionNormalCell.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {

    
    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    override var anchor: AnchorModel?{
        didSet{
            roomNameLabel.text = anchor?.room_name
        }
    }
}
