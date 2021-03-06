//
//  SelectedCalendarEventView.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/14/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

protocol CalendarEventViewProtocol: class {
    var onDidTapAddToCalendar: (() -> Void)? { get set }
}

class CalendarEventView: UIView, CalendarEventViewProtocol {

    var onDidTapAddToCalendar: (() -> Void)?
    
    // MARK: - UI Elements
    
    lazy var informationTitleLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.heading
        label.textColor = SCColors.scGrayText
        label.text = CalendarEventTitles.information.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var informationLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.bodyText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateAndTimeTitleLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.heading
        label.textColor = SCColors.scGrayText
        label.text = CalendarEventTitles.dateAndTime.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var startDateSubtitle: UILabel! = {
        let label = UILabel()
        label.font = SCFont.subHeading
        label.textColor = SCColors.scGrayText
        label.text = CalendarEventTitles.startDate.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var endDateSubtitle: UILabel! = {
        let label = UILabel()
        label.font = SCFont.subHeading
        label.textColor = SCColors.scGrayText
        label.text = CalendarEventTitles.endDate.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var startDateLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.bodyText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var endDateLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.bodyText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationTitleLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.heading
        label.textColor = SCColors.scGrayText
        label.text = CalendarEventTitles.location.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationLabel: UILabel! = {
        let label = UILabel()
        label.font = SCFont.bodyText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - StackView
    
    lazy var infoStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(informationTitleLabel)
        stackView.addArrangedSubview(informationLabel)
        
        
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var dateAndTimeStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(dateAndTimeTitleLabel)
        stackView.addArrangedSubview(startDateSubtitle)
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(endDateSubtitle)
        stackView.addArrangedSubview(endDateLabel)

        
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var locationStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(locationTitleLabel)
        stackView.addArrangedSubview(locationLabel)
        
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var bodyTextStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(infoStackView)
        stackView.addArrangedSubview(dateAndTimeStackView)
        stackView.addArrangedSubview(locationStackView)

        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainScrollView: UIScrollView! = {
        let scrollView = UIScrollView()
        scrollView.addSubview(bodyTextStackView)
        scrollView.addSubview(saveToCalendarButton)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var saveToCalendarButton: SCRoundedSchoolButton! = {
        let button = SCRoundedSchoolButton()
        button.setTitle(CalendarEventTitles.saveToCalendar.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAddToCalendar), for: .touchUpInside)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setMargins(top: Style.Layout.margin,
                   leading: Style.Layout.margin,
                   bottom: Style.Layout.margin,
                   trailing: Style.Layout.margin)
    }
    
    // MARK: - Init
    func customizeUI(_ calendarEvent: CalendarEvent?){
        setupScrollViewConstraints()
        setupStackViewConstraints()
        setupButtonConstraints()
        if let event = calendarEvent {
            backgroundColor = UIColor.white
            informationLabel.text = event.description
            locationLabel.text = event.location
            formatForStartAndEndDate(event)
        }
    }
    
    // MARK: - Methods
    func setupScrollViewConstraints(){
        addSubview(mainScrollView)
        mainScrollView.pinToMargins()
    }
    
    func setupStackViewConstraints(){
        bodyTextStackView.pinToTop()
        bodyTextStackView.pinToLeadingAndTrailingMargins()
        bodyTextStackView.pinToBottom()
    }
    
    func setupButtonConstraints(){
        saveToCalendarButton.topAnchor.constraint(equalTo: bodyTextStackView.bottomAnchor, constant: 40.0).isActive = true
        saveToCalendarButton.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        saveToCalendarButton.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: 0.6).isActive = true
        saveToCalendarButton.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
    }
    
    func formatForStartAndEndDate(_ event: CalendarEvent){
        if event.startDate != nil && event.endDate != nil {
            startDateLabel.text = event.startDate?.stringWithDateFormat(.weekDayAndTime)
            endDateLabel.text = event.endDate?.stringWithDateFormat(.weekDayAndTime)
            
            startDateSubtitle.isHidden = false
            endDateSubtitle.isHidden = false
            endDateLabel.isHidden = false
        } else {
            startDateLabel.text = event.startDate?.stringWithDateFormat(.weekDayAndTime)
            
            startDateSubtitle.isHidden = true
            endDateSubtitle.isHidden = true
            endDateLabel.isHidden = true
        }
    }

    @objc func handleAddToCalendar(){
        onDidTapAddToCalendar?()
    }
}
