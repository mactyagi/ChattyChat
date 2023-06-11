//
//  Status.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation

enum Status: String,CaseIterable{
    case Available
    case Busy
    case AtSchool = "At School"
    case AtTheMovies = "At The Movies"
    case BatteryAboutToDie = "Battery About to die"
    case AtWork = "At Work"
    case CantTalk = "Can't Talk"
    case InAMeeting = "In a meeting"
    case Sleeping = "Sleeping"
    case UrgentCallsOnly = "Urgent calls only"
    
    static var array: [Status]{
        var a: [Status] = []
        for value in Status.allCases{
            a.append(value)
        }
        return a
    }
}
