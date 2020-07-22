//
//  RecommendViewController.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit
import Alamofire


private let kItemMargin :CGFloat = 10
private let kItemW = ( kScreenW - 3 * kItemMargin ) / 2
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3
private let kHeaderViewH :CGFloat = 50
private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH :CGFloat = 90

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"

private let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: UIViewController {
    
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()

    private lazy var collectionView : UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        
       collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        
        
        
        return collectionView
    }()
    
    private lazy var cycleView:RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        
        cycleView.frame = CGRect(x:  0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        
        return cycleView
    }()
    
    private lazy var gameView :RecommendGameView = {
        
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        
        return gameView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = UIColor.white
        
        setupUI()
        
        loadData()
        
        
    }
    

   

}

extension RecommendViewController {
    
    private func setupUI(){
    
    view.addSubview(collectionView)
    
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        
       collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        
        
    }
    
    
}

extension RecommendViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let group = recommendVM.anchorGroups[section]
        
        return group.anchors.count
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let group = recommendVM.anchorGroups[indexPath.section]
        let anchor = group.anchors[indexPath.item]
        
        var cell : CollectionBaseCell
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
    
            
            
        }else{
           cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            
     
           
        }
        
        cell.anchor = anchor
        
         return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
       
         headerView.group = recommendVM.anchorGroups[indexPath.section]
        
        
        
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kItemW, height: kNormalItemH)
    }
    
}

extension RecommendViewController{
    private func loadData(){
        
        
        
        
        recommendVM.requestData {
            self.collectionView.reloadData()
            
            self.gameView.groups = self.recommendVM.anchorGroups
        }
        
        recommendVM.requestCycleData {
            
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        
        
    }
 }
}
