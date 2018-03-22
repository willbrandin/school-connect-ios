//
//  CalendarCardView.swift
//  
//
//  Created by William Brandin on 3/14/18.
//

import UIKit

class CalendarCardView: UIView {

    //MARK: - Properties
    var calendarEvent: CalendarEvent?
    
    
    //MARK: - UI Elements
    
    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.title()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var eventDateLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.dateSubTitle()
        label.textColor = UIColor.scGrayText()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var arrowImageView: CalendarCellSideButtonView! = {
        let arrowImg = CalendarCellSideButtonView()
        arrowImg.backgroundColor = UIColor.white
        arrowImg.clipsToBounds = false
        arrowImg.contentMode = .scaleAspectFit
        return arrowImg
    }()
    
    //MARK: - StackViews
    lazy var mainStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(textStackView)
        stackView.addArrangedSubview(arrowImageView)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var textStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(eventDateLabel)
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //MARK: - Init
    
    func customizeUI(){
         self.backgroundColor = UIColor.white
        setupMainStackViewConstraints()
        if let event = calendarEvent {
            titleLabel.text = event.title
            eventDateLabel.text = event.startDate?.stringWithDateFormat(.simpleDate)
            
        }
        
        updateCornerRadius()
    }
    
    override func layoutSubviews() {
        makeShadow()
    }
    
    
    //MARK: - Methods

    func setupMainStackViewConstraints(){
        addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14.0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0).isActive = true
        setupSideButtonViewConstraints()
    }
    
    func setupSideButtonViewConstraints(){
        arrowImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor).isActive = true
    }
    
    func updateCornerRadius() {
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
    }

    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 5.0
    }
}
