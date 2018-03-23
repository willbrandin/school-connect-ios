//
//  SCEnums.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/13/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation
import UIKit

enum UserDefaultKeys: String {
    case schoolChosen = "schoolIsChosen"
    case selectedId = "selectedSchoolId"
}

enum FirebasePathStrings: String {
    case schoolInfo = "SchoolInfo"
    case schools = "Schools"
    case appConfig = "appConfig"
    case infoPath = "Info"
    case newsPath = "News"
    case calendarPath = "Calendar"
    case homeLinks = "Links"
}

enum FirebaseSchoolInfoPath: String {
    case appConfig = "appConfig"
    case infoPath = "Info"
}

enum WBDateFormat: String {
    case simpleDate = "MM/dd/yyyy"
    case dateAndTime = "MMMM d, h:mm a"
    case weekDayAndTime = "EEEE, MMMM d, h:mm a"
    case serverDateFormat = "E, d MMM yyyy HH:mm:ss Z"
}

enum HomeCellIndex: Int {
    case greeting = 0
    case featureCell = 1
    case linksCell = 2
}

enum HomeFeature: String {
    
    case bullyReporting = "bully-report"
    case teacherContact = "teacher-contact"
    case mapOfSchool = "map-of-school"
    case yourSchedule = "your-schedule"
    
    enum FeatureCellText: String {
        case bullyReportTitle = "Bully Reporting"
        case bullyReportSubtitle = "Report instances of bullying directly to your principal."
        
        case teacherContactTitle = "Contact your Teacher"
        case teacherContactSubtitle = "Reach your teacher from your mobile device."
        
        case mapOfSchoolTitle = "School Map"
        case mapOfSchoolSubtitle = "Get an arial view of the school!"
        
        case yourScheduleTitle = "Your Schedule"
        case yourScheduleSubtitle = "Check out your student's schedule!"
    }
    
    
    func setFeatureView() -> UIViewController {
        let vc = UIViewController()
        
        switch self {
        case .bullyReporting:
            vc.title = PageTitles.bullyReporting.rawValue
        case .teacherContact:
            vc.title = PageTitles.teacherContact.rawValue
        case .mapOfSchool:
            vc.title = PageTitles.mapOfSchool.rawValue
        case .yourSchedule:
            vc.title = "Your sched"
        }
        return vc
    }
    
    func customizeUI(_ view: FeatureCardView) {
        switch self {
        case .bullyReporting:
            view.featureTitleLabel.text = FeatureCellText.bullyReportTitle.rawValue
            view.featureSubtitleText.text = FeatureCellText.bullyReportSubtitle.rawValue
            view.backgroundImageView.image = UIImage(named: "classroom")
        case .teacherContact:
            view.featureTitleLabel.text = FeatureCellText.teacherContactTitle.rawValue
            view.featureSubtitleText.text = FeatureCellText.teacherContactSubtitle.rawValue
            view.backgroundImageView.image = UIImage(named: "landingPageIcon")
        case .mapOfSchool:
            view.featureTitleLabel.text = FeatureCellText.mapOfSchoolTitle.rawValue
            view.featureSubtitleText.text = FeatureCellText.mapOfSchoolSubtitle.rawValue
            view.backgroundImageView.image = UIImage(named: "student-walk")
        case .yourSchedule:
            view.featureTitleLabel.text = FeatureCellText.yourScheduleTitle.rawValue
            view.featureSubtitleText.text = FeatureCellText.yourScheduleSubtitle.rawValue
            view.backgroundImageView.image = UIImage(named: "classroom")
        }
    }
    
    
}

enum PageTitles: String {
    case home = "Home"
    case news = "News"
    case confirmation = "Confirm"
    case schoolSearch = "School Search"
    case contact = "Contact"
    case calendar = "Calendar"
    case bullyReporting = "Report Bullying"
    case teacherContact = "Reach a Teacher"
    case mapOfSchool = "School Map"
    case yourSchedule = ""
}

enum CalendarEventTitles: String {
    case information = "Information"
    case dateAndTime = "Date and Time"
    case startDate = "Start Date"
    case endDate = "End Date"
    case location = "Location"
    case saveToCalendar = "Save to Calendar"
}

enum CellReuseIds: String {
    case calendarCell = "CalendarCell"
    case newsArticleCardCell = "NewsArticleCell"
    case homeGreetingCollectionCell = "HomeGreetingCell"
    case featureCollectionCell = "FeatureCell"
    case homeFeatureCollectionCell = "HomeFeatureCell"
    case homeLinkCollectionCell = "HomeLinkCell"
    case linkTableCell = "LinkTableCell"
    case searchSchoolNameTableCell = "SchoolNameCell"
}








