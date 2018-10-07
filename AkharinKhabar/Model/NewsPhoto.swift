//
//  NewsPhoto.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

enum NewsType {
    case video
    case vocal
    case other
    
    static func generateNewsType(video:Bool, vocal:Bool) -> NewsType{
        switch (video, vocal) {
        case (true,false):
            return .video
        case (false,true):
            return .vocal
        default:
            return .other
        }
    }
}

class NewsPhoto{
    var id:Int!
    var title:String!
    var imageURL:String?
    var publishedDate:String!
    var publishedTime:String!
    var commentNo:Int!
    var photoNo:Int!
    var seenNo:Int!
    var resourceTitle:String!
    var resourceImageURL:String!
    var newsType:NewsType!
    var heightOfImage:CGFloat!
    var widthOfImage:CGFloat!
    
    init(){
        
    }
    
    
    init(id:Int, title:String, date:String, time:String, imageURL:String, commentNo:Int, photoNo:Int, seenNo:Int, resourceTitle:String, resourceImageURL:String, isVideo:Bool, isVocal:Bool, heightOfImage:CGFloat, widthOfImage:CGFloat) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.publishedDate = date
        self.publishedTime = time
        self.commentNo = commentNo
        self.photoNo = photoNo
        self.seenNo = seenNo
        self.resourceTitle = resourceTitle
        self.resourceImageURL = resourceImageURL
        self.newsType = NewsType.generateNewsType(video: isVideo, vocal: isVocal)
        self.heightOfImage = heightOfImage
        self.widthOfImage = widthOfImage
    }
    
}
