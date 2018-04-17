//
//  SelectedNewsArticleView.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/14/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

protocol SelectedNewsDelegate: class {
    func didCloseArticle()
}

class SelectedNewsArticleView: UIView, SchoolColorable {

    
    //MARK: - Properties
    private var newsArticle: NewsArticle?
    weak var delegate: SelectedNewsDelegate?
    
    //MARK: - UI Elements
    
    
    lazy var dismissView: UIView! = {
        let view = UIView()
        
        view.backgroundColor = schoolSecondaryColor?.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dismissButton: UIButton! = {
        let button = UIButton()
        button.setBackgroundImage(SCImages.dismissWhite, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleDismissBtnTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newsImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = SCImages.OnBoardingImages.searchIcon // TEMP image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var newsTitle: UILabel! = {
        let label = UILabel()
        label.font = UIFont.heroTitle()
        label.text = newsArticle?.title
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var newsSubtitle: UILabel! = {
        let label = UILabel()
        label.font = UIFont.subHeading()
        label.text = newsArticle?.subtitle
        label.textColor = UIColor.darkText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pubDateLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.dateSubTitle()
        
        label.textColor = UIColor.scGrayText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if let date = newsArticle?.pubDate {
            label.text = "Date Published: \(date.stringWithDateFormat(.simpleDate))"
        }
        
        return label
    }()
    
    lazy var fullStoryLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.bodyText()
        label.text = newsArticle?.fullStory
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    
    func customizeUI(_ newsArticle: NewsArticle?){
        if let news = newsArticle {
            self.newsArticle = news
            self.backgroundColor = .white
        }
        setupImageConstraints()
        setupTitleLabelConstraints()
        setupDismissView()
        setupSubtitleConstraints()
        setupPubDateConstraints()
        setupBodyTextConstraints()
    }
    
    //MARK: - Methods
    
    func fetchAndCacheImage(){
        
    }
    
    func setupImageConstraints(){
        addSubview(newsImageView)
        
        newsImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        newsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        newsImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35).isActive = true
    }
    
    func setupTitleLabelConstraints(){
        addSubview(newsTitle)
        
        newsTitle.topAnchor.constraint(equalTo: newsImageView.bottomAnchor).isActive = true
        newsTitle.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 8.0).isActive = true
        newsTitle.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -8.0).isActive = true
//        newsTitle.heightAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 0.30).isActive = true
    }
    
    func setupDismissView(){
        addSubview(dismissView)
        
        dismissView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        dismissView.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -12.0).isActive = true
        dismissView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        dismissView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
        dismissView.addSubview(dismissButton)
        dismissButton.centerXAnchor.constraint(equalTo: dismissView.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: dismissView.centerYAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: dismissView.heightAnchor, multiplier: 0.4).isActive = true
        dismissButton.widthAnchor.constraint(equalTo: dismissView.widthAnchor, multiplier: 0.4).isActive = true

        
    }
    
    func setupSubtitleConstraints(){
        addSubview(newsSubtitle)
        newsSubtitle.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 10.0).isActive = true
        newsSubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        newsSubtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
        
    }
    
    func setupPubDateConstraints(){
        addSubview(pubDateLabel)
        pubDateLabel.topAnchor.constraint(equalTo: newsSubtitle.bottomAnchor, constant: 8.0).isActive = true
        pubDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
        pubDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
    }
    
    func setupBodyTextConstraints(){
        addSubview(fullStoryLabel)
        fullStoryLabel.topAnchor.constraint(equalTo: pubDateLabel.bottomAnchor, constant: 8.0).isActive = true
        fullStoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        fullStoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
    }
    
    @objc func handleDismissBtnTap(){
        delegate?.didCloseArticle()
    }
    
}
