//
//  MKMessage.swift
//  ChattyChat
//
//  Created by Manu on 15/06/23.
//

import Foundation
import MessageKit
import CoreLocation

class MKMessage: NSObject, MessageType{
    
    var messageId: String
    var kind: MessageKit.MessageKind
    var sentDate: Date
    var incoming: Bool
    var mkSender: MKSender
    var sender: SenderType { return mkSender}
    var senderInitials: String
    
    var status: String
    var readDate: Date
    
    init (message: LocalMessage){
        self.messageId = message.id
        mkSender = MKSender(senderId: message.senderId, displayName: message.senderName)
        self.status = message.status
        self.kind = MessageKind.text(message.message)
        
//        switch message.type {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
        self.senderInitials = message.senderinitials
        self.sentDate = message.date
        self.readDate = message.readDate
        incoming = User.currentId != mkSender.senderId
    }
    init(messageId: String, kind: MessageKit.MessageKind, sentDate: Date, incoming: Bool, mkSender: MKSender, senderInitials: String, status: String, readDate: Date) {
        self.messageId = messageId
        self.kind = kind
        self.sentDate = sentDate
        self.incoming = incoming
        self.mkSender = mkSender
        self.senderInitials = senderInitials
        self.status = status
        self.readDate = readDate
    }
    
    
}
