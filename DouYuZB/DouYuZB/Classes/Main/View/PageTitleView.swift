//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by azu on 2020/7/20.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit




protocol pageTitleViewdelegate : class  {
    func pageTitleView(titleView:PageTitleView,selectedIndex index: Int)
}

private let kScrollLineH :CGFloat = 2
private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let kSelectedColor : (CGFloat,CGFloat,CGFloat)  = (255,128,0)


class PageTitleView: UIView {

    private var titles:[String]
    weak var delegate:pageTitleViewdelegate?
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
        
    }()
    
    private lazy var scrollLine :UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    
    private var currentIndex:Int = 0
    
    init(frame: CGRect,titles:[String]) {
        
        
        self.titles = titles
        
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension PageTitleView{
    
    private func setupUI(){
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        
        setTitleLabels()
        
        setupBottomLineAndScrollLine()
    }
    
    
   
    
    private func setTitleLabels(){
        
      
        
        let labelW :CGFloat = frame.width / CGFloat(titles.count)
        let labelH :CGFloat = frame.height - kScrollLineH
        let labelY :CGFloat = 0
        
        for (index,title) in titles.enumerated(){
            
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            
            let labelX :CGFloat = labelW * CGFloat(index)
           
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(tapGes:)))
            
            label.addGestureRecognizer(tapGes)
            
        }
        
    }
    
    private func setupBottomLineAndScrollLine(){
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        
        let lineH:CGFloat = 0.5
        
        
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        
        addSubview(bottomLine)
        
        scrollView.addSubview(scrollLine)
        
        guard   let firstLabel = titleLabels.first else{
            return
        }
        firstLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1
            , b: kSelectedColor.2)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        
    }
    
}

extension PageTitleView{
    @objc private func titleLabelClick(tapGes:UITapGestureRecognizer){
        
        guard let currentLabel =  tapGes.view as? UILabel else{
            return
        }
        let oldLabel = titleLabels[currentIndex]
        
        currentIndex = currentLabel.tag
        currentLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1
            , b: kSelectedColor.2)
        oldLabel.textColor =  UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

extension PageTitleView{
    func setTitleWithProgress(progress:CGFloat,sourceIndex:Int,targetIndex:Int)  {
        
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        let moveTotalX =   targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        
        let colorDelta  = (kSelectedColor.0 - kNormalColor.0,kSelectedColor.1 - kNormalColor.1 ,kSelectedColor.2 - kNormalColor.2 )
        
        sourceLabel.textColor = UIColor(r: kSelectedColor.0 - colorDelta.0 * progress  , g: kSelectedColor.1 - colorDelta.1 * progress, b: kSelectedColor.2 - colorDelta.2 * progress)
        
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        currentIndex = targetIndex
    }
}
