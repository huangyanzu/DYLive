//
//  RecommendCycleView.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cycleModels :[CycleModel]?{
        didSet{
            collectionView.reloadData()
            
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIView.AutoresizingMask.init(rawValue: 0)
        
       
        
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
        
        
        
    }
    
    override func layoutSubviews() {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.isPagingEnabled = true
        layout.scrollDirection = .horizontal
        
        
    }
    

}
extension RecommendCycleView{
    
    class func recommendCycleView()->RecommendCycleView {
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
        
    }
    
}

extension RecommendCycleView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycleModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        
          cell.cycleModel = cycleModels![indexPath.item]
        
        
        
        return cell
    }
    

}
extension RecommendCycleView:UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
       pageControl.currentPage = Int(offsetX / scrollView.bounds.width)
        
        
    }
}
