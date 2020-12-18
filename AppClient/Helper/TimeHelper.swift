//
//  TimeHelper.swift
//  WeTalk
//
//  Created by gaoyu shi on 19/11/20.
//

import Foundation
func getNowTime()->String{
    let now = Date()
    
    let formatter2 = DateFormatter()
    formatter2.dateStyle = .none
    formatter2.timeStyle = .short
    let timeString = formatter2.string(from: now)
    return timeString
}

func getNowDate()->String{
    let now = Date()
    let formatter1 = DateFormatter()
    formatter1.dateStyle = .short
    formatter1.timeStyle = .none
    let dateString = formatter1.string(from: now)
    return dateString
}


func ConvertDateToString(date:Date)->String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return formatter.string(from: date)
}
