//
//  CalendarTableViewCell.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/14/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell, CellLoadableView {

    // MARK: - Properties
    //static var cellId = CellReuseIds.calendarCell.rawValue
    var cardView: CalendarCardView!
    
    // MARK: - Life Cycle and Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCardViewConstraints()
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Methods
    
    func configureCell(_ calendarEvent: CalendarEvent?){
        if let event = calendarEvent {
            cardView.calendarEvent = event
        }
    }
    
    private func setupCardViewConstraints(){
        cardView = CalendarCardView()
        addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.0).isActive = true
        cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -23.0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
    }
}
