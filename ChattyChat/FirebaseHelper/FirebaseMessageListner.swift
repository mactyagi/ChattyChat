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
    var newChatListener: ListenerRegistration!
    var updatedChatListener: ListenerRegistration!
    private init(){}
    
    func listenForNewChats(_ documentId: String, collectionId: String, lastMessageDate: Date){
        newChatListener = FirebaseReference(.Messages).document(documentId).collection(collectionId).whereField(kDATE, isGreaterThan: lastMessageDate).addSnapshotListener({ querySnapshot, error in
            guard let snapShot = querySnapshot else { return }
            for change in snapShot.documentChanges{
                if change.type == .added{
                    let result = Result{
                        try? change.document.data(as: LocalMessage.self)
                    }
                    switch result {
                    case .success(let message):
                        if let message{
                            RealmManager.shared.saveToRealm(message)
                        }else{
                            print("Doucment doesn't exist")
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
             
        })
    }
    
    func checkForOldChats(_ documentId: String, collectionId: String){
        FirebaseReference(.Messages).document(documentId).collection(collectionId).getDocuments { querySnapShot, error in
            guard let documents = querySnapShot?.documents else {
                print("No documents for old chats")
                return
            }
            var oldMessages = documents.compactMap { querySnapshots -> LocalMessage? in
                return try? querySnapshots.data(as: LocalMessage.self)
            }
            oldMessages.sort { $0.date < $1.date }
            for message in oldMessages{
                RealmManager.shared.saveToRealm(message)
            }
        }
    }
    
    //Add Update Delete
    
    func addMessage(message: LocalMessage, memberId: String){
        do{
            try FirebaseReference(.Messages).document(memberId).collection(message.chatRoomId).document(message.id).setData(from: message)
        }catch{
            print("eeror in saving messaging in Firebase", error.localizedDescription)
        }
        
    }
}
