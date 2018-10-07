//
//  NewsPhotoCollectionViewDelegate.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

protocol NewsPhotoCollectionViewDelegate {
    func newsPhotoCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, viewController vc: UIViewController)
    func newsPhotoCollectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    
}
