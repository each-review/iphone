//
//  Country.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import Foundation

class Country {

    var name: String
    var timeZone: String
    
    lazy var dateFormattter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()

        formatter.dateFormat = "a hh:mm"
        
        formatter.timeZone = TimeZone(abbreviation: timeZone)
        return formatter
    }()
    
    
    lazy var dateFormatterKorea: DateFormatter = {
       
        let dateFormatterKorea: DateFormatter = DateFormatter()
        dateFormatterKorea.timeZone = TimeZone(abbreviation: "kr_KR")
        dateFormatterKorea.dateFormat = "hhmm"
        
        return dateFormatterKorea
        
    }()
    
    lazy var dateFormatterAnother: DateFormatter = {
        
        let dateFormatterAnother: DateFormatter = DateFormatter()
        dateFormatterAnother.timeZone = TimeZone(abbreviation: timeZone)
        dateFormatterAnother.dateFormat = "hhmm"
        
        return dateFormatterAnother
    }()
    
    lazy var dateFormatterKoreaDay: DateFormatter = {

        let dateFormatterKoreaDay: DateFormatter = DateFormatter()
        dateFormatterKoreaDay.timeZone = TimeZone(abbreviation: "kr_KR")
        dateFormatterKoreaDay.dateFormat = "d"
        
        return dateFormatterKoreaDay
    }()
    
    lazy var dateFormatterAnotherDay: DateFormatter = {
        let dateFormatterAnotherDay: DateFormatter = DateFormatter()
        dateFormatterAnotherDay.timeZone = TimeZone(abbreviation: timeZone)
        dateFormatterAnotherDay.dateFormat = "d"
        
        return dateFormatterAnotherDay
    }()
    
    
    
    var time: String {
        let date = Date()
        let current = self.dateFormattter.string(from: date)
        return current
    }

    var timeDifference: String {
       
        let date = Date()
        
        let koreaTime = self.dateFormatterKorea.string(from: date)
        let anotherTime = self.dateFormatterAnother.string(from: date)
        let koreaDay = self.dateFormatterKoreaDay.string(from: date)
        let anotherDay = self.dateFormatterAnotherDay.string(from: date)
        print("koreaDay = \(koreaDay), anotherDay = \(anotherDay)")
        
        let koreaDayResult: Int? = Int(koreaDay)
        let anotherDayResult: Int? = Int(anotherDay)
        let dayResult = koreaDayResult! - anotherDayResult!
        
        
        let koreanResult: Int? = Int(koreaTime)
        let anotherResult: Int? = Int(anotherTime)
        let result = koreanResult! - anotherResult!
        
        print(dayResult)
        
        if dayResult == 0 {
            return "오늘, +\(result)시간"
        } else if dayResult > 1 {
            return "내일, +\(result)시간"
        } else {
            return "어제, +\(result)시간"
        }
        
        
        
     
        
        
        
        
    }
    
    init(name: String, timeZone: String) {
        self.name = name
        self.timeZone = timeZone
    }
    
    
    
    
    
    
    
    
    
    
}

//    var timeDifference: String {
//
////        let date = Date()
////        let koreaFormatter = dateFormattter
////        koreaFormatter.timeZone = TimeZone(abbreviation: "KST")
////        let koreaCurrent = koreaFormatter.string(from: date)
////
////
////        let date2 = Date()
////        let anotherFormatter = dateFormattter
////        anotherFormatter.timeZone = TimeZone(abbreviation: "PDT")
////        let anotherCurrent = anotherFormatter.string(from: date2)
//
//
//
//
////        let difference = (Int(koreaCurrent)! - Int(anotherCurrent)!)
////        return "\(difference)"
//
//    }
