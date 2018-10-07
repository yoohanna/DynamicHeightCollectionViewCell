//
//  BaseNetwork.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SWXMLHash

class BaseNetwork{
    static let sharedInstance = BaseNetwork()
    var config = Config.sharedInstance
    private init() {}
    
    private func loadData(pageNo:Int, method: String = "POST", completionHandler: @escaping ((_ result: XMLIndexer, _ error: Bool, _ msg: String ) -> ())){
        var result:XMLIndexer?
        var final_url = ""
        final_url = "\(config.postURL)\(pageNo)"
        Alamofire.request(final_url) .responseData { response in
            debugPrint("All Response Info: \(response)")
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                let xmlInner = SWXMLHash.parse(utf8Text)
                result = xmlInner
                completionHandler(result!, false,"")
            }
        }
    }
    
    func getImageDimensions(from url: URL) -> (width: CGFloat, height: CGFloat) {
        if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! CGFloat
                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! CGFloat
                return (pixelWidth, pixelHeight)
            }
        }
        return (0, 0)
    }
    
    func getAllNewsPhoto(pageNo:Int,completionHandler: @escaping ((_ data: [NewsPhoto], _ error: Bool, _ msg: String ) -> ())){
        var allnewsPhoto = [NewsPhoto]()
        loadData(pageNo: pageNo) { (data, error, msg) in
            for element in data["LatestNews"]["News"].all {
                let id = Int((element["id"].element?.text)!)!
                let title = (element["title"].element?.text)!
                let PublishDate = (element["PublishDate"].element?.text)!
                let PublishTime = (element["PublishTime"].element?.text)!
                let thumb_url1 = (element["thumb_url1"].element?.text)!
                let commentNo = Int((element["commentNo"].element?.text)!)!
                let imageNo = Int((element["imageNo"].element?.text)!)!
                let visitNo = Int((element["visitNo"].element?.text)!)!
                let resourceTitle = (element["resTitle"].element?.text)!
                let resourceImage = (element["resource"].element?.text)!
                let isVideoStream = (element["IsVideoStream"].element?.text)!.toBool()!
                let isVocalStream = (element["IsVocalStream"].element?.text)!.toBool()!
                let height = self.getImageDimensions(from: URL(string: thumb_url1)!).height
                let width = self.getImageDimensions(from: URL(string: thumb_url1)!).width
                allnewsPhoto.append(NewsPhoto(id: id, title: title, date: PublishDate, time: PublishTime, imageURL: thumb_url1, commentNo: commentNo, photoNo: imageNo, seenNo: visitNo, resourceTitle: resourceTitle, resourceImageURL: resourceImage, isVideo: isVideoStream, isVocal: isVocalStream, heightOfImage: height, widthOfImage: width))
            }
            completionHandler(allnewsPhoto,false,"")
        }
        
    }
    
}
