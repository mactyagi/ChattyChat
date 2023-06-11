//
//  FirebaseRecentListener.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
import Firebase


class FirebaseRecentListener{
    static let shared = FirebaseRecentListener()
    private init() {}
    
    func downloadRecentChatsFromFirestore(completion: @escaping(_ allRecents: [RecentChat]) -> Void){
        FirebaseReference(.Recent).whereField(kSENDERID, isEqualTo: User.currentId).addSnapshotListener { snapShot, error in
            var recentChats: [RecentChat] = []
            guard let documents = snapShot?.documents else{ return }
            let allRecents = documents.compactMap { querySnapshot in
                return try? querySnapshot.data(as: RecentChat.self)
            }
            for recent in allRecents{
                if !recent.lastMessage.isEmpty{
                    recentChats.append(recent)
                }
            }
            
            recentChats.sort { $0.date! > $1.date! }
            completion(recentChats)
        }
    }
    
    
    func resetRecentCounter(chatRoomId: String){
        FirebaseReference(.Recent).whereField(kCHATROOMID, isEqualTo: chatRoomId).whereField(kSENDERID, isEqualTo: User.currentId).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else{
                print("No document found")
                return
            }
            
            let allRecent = documents.compactMap { querySnapshot in
                return try? querySnapshot.data(as: RecentChat.self)
            }
            
            for recent in allRecent{
                self.clearUnreadCounter(recent: recent)
            }
        }
        
    }
    
    func clearUnreadCounter(recent: RecentChat){
        var newRecent = recent
        newRecent.unreadCount = 0
        saveRecent(newRecent)
    }
    
    func saveRecent(_ recent: RecentChat){
        do{
            try FirebaseReference(.Recent).document(recent.id).setData(from: recent)
        }catch{
            print("error saving recent Chat", error.localizedDescription)
        }
    }
    
    func deleteRecent(_ recent: RecentChat){
        FirebaseReference(.Recent).document(recent.id).delete()
    }
}
