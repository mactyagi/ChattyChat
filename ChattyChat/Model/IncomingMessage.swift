//
//  IncomingMessage.swift
//  ChattyChat
//
//  Created by Manu on 21/06/23.
//

import Foundation
import MessageKit
import CoreLocation

class IncomingMessage{
    var collectionView: MessagesViewController
    init(collectionView: MessagesViewController) {
        self.collectionView = collectionView
    }
    
    func createMessage(localMessage: LocalMessage) -> MKMessage?{
        MKMessage(message: localMessage)
    }
}
