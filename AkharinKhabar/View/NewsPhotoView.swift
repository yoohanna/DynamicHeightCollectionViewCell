//
//  NewsPhotoView.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import UIKit

class NewsPhotoView: UIView {
    public static var rowHeights:[Int:CGFloat] = [:]
    
    // MARK: Public
    public var newsPhoto: NewsPhoto!{
        didSet{
            self.updateUI()
        }
    }
    public var photoImageConstraint:NSLayoutConstraint!
    public static var height: CGFloat {
        return  105
    }
    
    var delegate: NewsPhotoCollectionViewDelegate?
    
    let resourceTitle:UILabel = UILabel()
    let moreIconImageView:UIImageView = UIImageView()
    let dateLabel:UILabel = UILabel()
    let photoImageView:DVPImageView = DVPImageView()
    let photoTitle:UILabel = UILabel()
    let otherPhotosButton:UIButton = UIButton()
    let favoriteButton:UIButton = UIButton()
    let seenButton:UIButton = UIButton()
    let commentButton:UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    fileprivate func defaultInit(){
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.photoImageConstraint = self.photoImageView.heightAnchor.constraint(equalToConstant: 0)
        self.photoImageConstraint.isActive = true

        for v in [resourceTitle, moreIconImageView, dateLabel, photoImageView, photoTitle, seenButton, favoriteButton, commentButton] as [UIView]{
            v.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(v)
        }
        
        NSLayoutConstraint(item: resourceTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: resourceTitle, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: resourceTitle, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: resourceTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20).isActive = true
        resourceTitle.configure(size: 12, color: .lightGray)
        
        NSLayoutConstraint(item: moreIconImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: moreIconImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: moreIconImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.03, constant: 0).isActive = true
        NSLayoutConstraint(item: moreIconImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.03, constant: 0).isActive = true
        moreIconImageView.image = UIImage(named: "more_icon")?.withRenderingMode(.alwaysTemplate)
        moreIconImageView.tintColor = .lightGray
        
        NSLayoutConstraint(item: dateLabel, attribute: .centerY, relatedBy: .equal, toItem: self.moreIconImageView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: self.moreIconImageView, attribute: .right, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
        NSLayoutConstraint(item: dateLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 20).isActive = true
        dateLabel.configure(size: 12, color: .lightGray)
        dateLabel.textAlignment = .left
        
        NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: self.resourceTitle, attribute: .bottom, multiplier: 1, constant: 6).isActive = true
        NSLayoutConstraint(item: photoImageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: photoImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
        self.otherPhotosButton.translatesAutoresizingMaskIntoConstraints = false
        self.photoImageView.addSubview(self.otherPhotosButton)
        NSLayoutConstraint(item: otherPhotosButton, attribute: .bottom, relatedBy: .equal, toItem: self.photoImageView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: otherPhotosButton, attribute: .left, relatedBy: .equal, toItem: self.photoImageView, attribute: .left, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: otherPhotosButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 100).isActive = true
        NSLayoutConstraint(item: otherPhotosButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30).isActive = true
        self.otherPhotosButton.backgroundColor = .white
        self.otherPhotosButton.layer.cornerRadius = 5
        self.otherPhotosButton.setTitleColor(UIColor(hex: "d50100"), for: .normal)
        self.otherPhotosButton.titleLabel?.font = UIFont.mySystemFont(ofSize: 10)
        self.otherPhotosButton.tintColor = UIColor(hex: "d50100")

        NSLayoutConstraint(item: photoTitle, attribute: .top, relatedBy: .equal, toItem: self.photoImageView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: photoTitle, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: photoTitle, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: photoTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 50).isActive = true
        photoTitle.configure(size: 12, color: .black)

        NSLayoutConstraint(item: favoriteButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: favoriteButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: favoriteButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 70).isActive = true
        NSLayoutConstraint(item: favoriteButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30).isActive = true
        self.favoriteButton.setImage(UIImage(named: "addBook_icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.favoriteButton.tintColor = .lightGray

        NSLayoutConstraint(item: seenButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: seenButton, attribute: .left, relatedBy: .equal, toItem: self.favoriteButton, attribute: .right, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: seenButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 70).isActive = true
        NSLayoutConstraint(item: seenButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30).isActive = true
        self.seenButton.tintColor = .lightGray
        self.seenButton.setTitleColor(.lightGray, for: .normal)
        self.seenButton.titleLabel?.font = UIFont.mySystemFont(ofSize: 12)

        NSLayoutConstraint(item: commentButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: commentButton, attribute: .left, relatedBy: .equal, toItem: self.seenButton, attribute: .right, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: commentButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 70).isActive = true
        NSLayoutConstraint(item: commentButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30).isActive = true
        self.commentButton.tintColor = .lightGray
        self.commentButton.setTitleColor(.lightGray, for: .normal)
        self.commentButton.titleLabel?.font = UIFont.mySystemFont(ofSize: 12)


        
        for idx in 0...1{
            let divider:UIView = UIView()
            divider.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(divider)
            if idx == 0{
                NSLayoutConstraint(item: divider, attribute: .top, relatedBy: .equal, toItem: self.resourceTitle, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: divider, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: divider, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -5).isActive = true
                NSLayoutConstraint(item: divider, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1).isActive = true
            }else{
                NSLayoutConstraint(item: divider, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -30).isActive = true
                NSLayoutConstraint(item: divider, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: divider, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -5).isActive = true
                NSLayoutConstraint(item: divider, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1).isActive = true
            }
            divider.backgroundColor = UIColor(hex: "e1e1e1")
        }
    }
    
    
    func getHeaderInformations (myUrl: URL, completion: @escaping (_ content: String?) -> ()) {
        var request = URLRequest(url: myUrl)
        request.httpMethod = "HEAD"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let reponse = response as? HTTPURLResponse, let contentType = reponse.allHeaderFields["Content-Type"],let contentLength = reponse.allHeaderFields["Content-Length"]
                else{
                    completion(nil)
                    return
            }
            let content = String(describing: contentType) + "/" + String(describing: contentLength)
            completion(content)
        }
        task.resume()
    }
    
    fileprivate func updateUI(){
        self.resourceTitle.text = self.newsPhoto.resourceTitle
        self.dateLabel.text = "\(self.newsPhoto.publishedTime!)".convertEngNumToPersianNum()
        self.photoImageView.image = nil
        if let imageURL = self.newsPhoto.imageURL{
            self.photoImageView.loadImageUsingURLString(urlString: imageURL)
        }
        self.photoTitle.text = self.newsPhoto.title
        // seen count update
        self.seenButton.set(image: UIImage(named: "seen_icon")?.withRenderingMode(.alwaysTemplate), title: "\(self.newsPhoto.seenNo!)".convertEngNumToPersianNum(), titlePosition: .right, additionalSpacing: 20, state: .normal)
        // other photos update
        if self.newsPhoto.photoNo > 1{
            self.otherPhotosButton.isHidden = false
            self.otherPhotosButton.set(image: UIImage(named: "camera_icon")?.withRenderingMode(.alwaysTemplate), title: "\(self.newsPhoto.photoNo!) عکس".convertEngNumToPersianNum(), titlePosition: .right, additionalSpacing: 20, state: .normal)
        }else{
            self.otherPhotosButton.isHidden = true
        }
        // comments update
        if self.newsPhoto.commentNo > 0{
            self.commentButton.isHidden = false
            self.commentButton.set(image: UIImage(named: "comment_icon")?.withRenderingMode(.alwaysTemplate), title: "\(self.newsPhoto.commentNo!)".convertEngNumToPersianNum(), titlePosition: .right, additionalSpacing: 20, state: .normal)
        }else{
            self.commentButton.isHidden = true
        }
    }
    
}

