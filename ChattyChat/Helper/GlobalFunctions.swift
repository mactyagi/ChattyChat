//
//  GlobalFunctions.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
func fileNameFrom(fileUrl: String) -> String{
    let name = (fileUrl.components(separatedBy: "_").last)?.components(separatedBy: ".").first
    return name!
}

func timeElapsed(_ date: Date) -> String{
    let seconds = Date().timeIntervalSince(date)
    var elapsed = ""
    if seconds < 60{
        elapsed = "Just now"
    }else if seconds < 60 * 60{
        let minutes = Int(seconds / 60)
        let minText = minutes > 1 ? "mins" : "min"
        elapsed = "\(minutes) \(minText)"
    }else if seconds < 24 * 60 * 60{
        let hours = Int(seconds / (60 * 60))
        let hourText = hours > 1 ? "hours" : "hour"
        elapsed = "\(hours) \(hourText)"
    }else{
        elapsed = date.longDate()
    }
    return elapsed 
}
