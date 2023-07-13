//
//  MessageDisplayDelegate.swift
//  ChattyChat
//
//  Created by Manu on 15/06/23.
//

import Foundation
import MessageKit

extension ChatViewController: MessagesDisplayDelegate{
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return .label
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? MessageDefaults.bubbleColorOutgoing : MessageDefaults.bubbleColorIncoming
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(tail, .curved )
    }
}
