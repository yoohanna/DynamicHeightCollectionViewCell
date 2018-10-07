//
//  NewsPhotoCollectionViewCell.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

class NewsPhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: Public
    public var newsPhoto: NewsPhoto! {
        didSet{
            self.updateUI()
        }
    }
    
    // MARK: Var
    var delegate: NewsPhotoCollectionViewDelegate?
    
    // MARK: Private
    public var view: NewsPhotoView = NewsPhotoView()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    // MARK: Function
    fileprivate func defaultInit(){
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        for v in [view] as [UIView] {
            v.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(v)
        }
        // view
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        self.view.delegate = self
    }
    
    fileprivate func updateUI(){
        self.view.newsPhoto = self.newsPhoto
    }
}

extension NewsPhotoCollectionViewCell: NewsPhotoCollectionViewDelegate{
    internal func newsPhotoCollectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.delegate?.newsPhotoCollectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    }
    func newsPhotoCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, viewController vc: UIViewController) {
        self.delegate?.newsPhotoCollectionView(collectionView, didSelectItemAt: indexPath, viewController: vc)
    }
    
}
