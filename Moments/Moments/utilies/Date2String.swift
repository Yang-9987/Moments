//
//  Date2String.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import Foundation

func date2string(Datestr: Date) -> String {
    let eventdate = Datestr
    let dateformatter = DateFormatter()
    
    dateformatter.dateStyle = .full
    dateformatter.timeStyle = .long
    dateformatter.dateFormat = "YYYY-MM-dd"
    let dateString = dateformatter.string(from: eventdate)
    
    return dateString
}
