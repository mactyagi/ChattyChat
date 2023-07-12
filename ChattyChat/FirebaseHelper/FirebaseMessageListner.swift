//
//  FirebaseMessageListner.swift
//  ChattyChat
//
//  Created by Manu on 20/06/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirebaseMessageListner{
    static let shared = FirebaseMessageListner()
    
    private init(){}
    
    //Add Update Delete
    
    func addMessage(message: LocalMessage, memberId: String){
        do{
            try FirebaseReference(.Messages).document(memberId).collection(message.chatRoomId).document(message.id).setData(from: message)
        }catch{
            print("eeror in saving messaging in Firebase", error.localizedDescription)
        }
        
    }
}
