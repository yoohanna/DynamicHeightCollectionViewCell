//
//  NewsPhotoCollectionView.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import UIKit

class NewsPhotoCollectionView: UIView {
    var rowHeights:[Int:CGFloat] = [:]
    // MARK: Public
    public var newsPhotos: [NewsPhoto] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    public var delegate: NewsPhotoCollectionViewDelegate?
    
    // MARK: Private
    fileprivate var spacing: CGFloat = CGFloat(8)
    fileprivate var collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
    fileprivate lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: self.spacing, left: self.spacing, bottom: 0, right: self.spacing)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = self.spacing
        layout.scrollDirection = .vertical
        return layout
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    fileprivate func defaultInit(){
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(NewsPhotoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        NSLayoutConstraint(item: self.collectionView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.collectionView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        self.collectionView.collectionViewLayout = self.collectionViewLayout
    }
    
    
}

extension NewsPhotoCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.newsPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewsPhotoCollectionViewCell
        cell.view.photoImageView.image = nil
        cell.view.photoImageConstraint.constant = 0
        cell.view.photoImageConstraint.constant = self.rowHeights[indexPath.row]!
        cell.newsPhoto = newsPhotos[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension NewsPhotoCollectionView: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        Open News page
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.delegate?.newsPhotoCollectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    }
    
}

extension NewsPhotoCollectionView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var imageEstimateHeight:CGFloat = 0
        let imageWidth = CGFloat(self.newsPhotos[indexPath.row].widthOfImage!)
        let imageHeight = CGFloat(self.newsPhotos[indexPath.row].heightOfImage!)
        
        let widthCell = (self.collectionView.frame.width ) - self.spacing*2
        if imageWidth == imageHeight{
            imageEstimateHeight = widthCell
        }else{
            imageEstimateHeight = widthCell / imageWidth * imageHeight
        }
        let heightCell = NewsPhotoView.height + imageEstimateHeight
        self.rowHeights[indexPath.row] = imageEstimateHeight
        
        return CGSize(width: widthCell, height: heightCell)
    }
}

extension NewsPhotoCollectionView: NewsPhotoCollectionViewDelegate{
    func newsPhotoCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, viewController vc: UIViewController) {
        self.delegate?.newsPhotoCollectionView(collectionView, didSelectItemAt: indexPath, viewController: vc)
    }
    
    func newsPhotoCollectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.delegate?.newsPhotoCollectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    }
}
