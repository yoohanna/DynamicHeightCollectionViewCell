//
//  ViewController.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class NewsPhotoViewController: UIViewController {

    let network = BaseNetwork.sharedInstance
    let preloader = Preloader.sharedInstance
    
    fileprivate let newsPhotoCollectionView:NewsPhotoCollectionView = NewsPhotoCollectionView()
    fileprivate var pageNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "f1f1f1")
        self.insertRightNavbarItems(title: "عکس", icon: "menu_icon")
        self.insertLeftNavbarItems(items: UIImage(named: "back_icon")!, UIImage(named: "reload_icon")!, UIImage(named: "searchFill_icon")!, UIImage(named: "bookmark_icon")!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadNewsPhotos()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.prepareNewsPhoto()
    }
    
    fileprivate func loadNewsPhotos(){
        if self.pageNumber >= 0 {
            self.preloader.startAnimating()
            network.getAllNewsPhoto(pageNo: self.pageNumber) { (result, error, msg) in
                self.preloader.stopAnimating()
                if !error{
                    if result.count == 0 {
                        self.pageNumber = -1
                    }
                    self.newsPhotoCollectionView.newsPhotos += result
                    
                }else{
                    print("Server not response")
                }
            }
            self.pageNumber += 1
        }
    }
    
    
    
    fileprivate func removeAllContainerView(){
        if let _ = self.newsPhotoCollectionView.superview{
            self.newsPhotoCollectionView.removeFromSuperview()
        }
    }
    

    fileprivate func prepareNewsPhoto(){
        self.newsPhotoCollectionView.delegate = self
        self.removeAllContainerView()
        self.prepareContainer(sender: self.newsPhotoCollectionView)
    }
    
    fileprivate func prepareContainer(sender: UIView){
        sender.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sender)
        NSLayoutConstraint(item: sender, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sender, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sender, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sender, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
}

extension NewsPhotoViewController: NewsPhotoCollectionViewDelegate{
    func newsPhotoCollectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.newsPhotoCollectionView.newsPhotos.count - 1{
            self.loadNewsPhotos()
        }
    }
    
    func newsPhotoCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, viewController vc: UIViewController) {
        //
    }
}


