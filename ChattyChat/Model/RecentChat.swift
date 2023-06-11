//
//  RecentChat.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
import FirebaseFirestoreSwift


struct RecentChat: Codable{
    var id = ""
    var chatRoomId = ""
    var senderId = ""
    var senderName = ""
    var recieverId = ""
    var recieverName = ""
    @ServerTimestamp var date = Date()
    var memberIds = [""]
    var lastMessage = ""
    var unreadCount = 0
    var avatarLink = ""
    
}
