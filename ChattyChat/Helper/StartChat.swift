//
//  StartChat.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
import Firebase
func startChat(user1: User, user2: User) -> String{
    let chatRoomId = chatRoomIdFrom(user1Id: user1.id, user2Id: user2.id)
    createRecentItems(chatRoomId: chatRoomId, users: [user1, user2])
    return chatRoomId
}

func createRecentItems(chatRoomId: String, users: [User]){
    // does user have recent?
    var membersIdsToCreateRecent = [users.first!.id, users.last!.id]
    FirebaseReference(.Recent).whereField(kCHATROOMID, isEqualTo: chatRoomId).getDocuments { snapshot, error in
        guard let snapshot = snapshot else { return }
        if !snapshot.isEmpty{
            membersIdsToCreateRecent = removeMemberWhoHasRecent(snapshot: snapshot, memberIds: membersIdsToCreateRecent)
            
        }
        
        for userId in membersIdsToCreateRecent{
            let senderUser = userId == User.currentId ? User.currentUser! : getRecieverFrom(users: users)
            
            let recieverUser = userId == User.currentId ? getRecieverFrom(users: users) : User.currentUser!
            
            let recentObject = RecentChat(id: UUID().uuidString, chatRoomId: chatRoomId, senderId: senderUser.id, senderName: senderUser.username, recieverId: recieverUser.id, recieverName: recieverUser.username, date: Date(), memberIds: [senderUser.id, recieverUser.id], lastMessage: "", unreadCount: 0, avatarLink: recieverUser.avatarLink)
            FirebaseRecentListener.shared.saveRecent(recentObject)
        }
    }
}

func removeMemberWhoHasRecent(snapshot: QuerySnapshot, memberIds: [String]) -> [String]{
   var memberIdsToCreateRecent = memberIds
    for recentData in snapshot.documents{
        let currentRecent = recentData.data()
        if let currrentUserId = currentRecent[kSENDERID]{
            if memberIdsToCreateRecent.contains(currrentUserId as! String){
                memberIdsToCreateRecent.remove(at: memberIdsToCreateRecent.firstIndex(of: currrentUserId as! String)!)
            }
        }
    }
    return memberIdsToCreateRecent
}

func chatRoomIdFrom(user1Id: String, user2Id: String) -> String{
    var chatRoomId = ""
    let value = user1Id.compare(user2Id).rawValue
    
    chatRoomId = value < 0 ? (user1Id + user2Id) : (user2Id + user1Id)
    return chatRoomId
}

func getRecieverFrom(users: [User]) -> User{
    var allUsers = users
    allUsers.remove(at: allUsers.firstIndex(of: User.currentUser!)!)
    return allUsers.first!
}
