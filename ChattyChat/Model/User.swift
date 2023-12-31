//
//  User.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct User: Codable, Equatable{
    var id: String = ""
    var username: String
    var email: String
    var pushId = ""
    var avatarLink = ""
    var status : String
    
    static var currentId: String{
        return Auth.auth().currentUser!.uid
    }
    
    
    static var currentUser: User?{
        if Auth.auth().currentUser != nil{
            if let dict = UserDefaults.standard.data(forKey: kCURRENTUSER){
                let decoder = JSONDecoder()
                do{
                    let object = try decoder.decode(User.self, from: dict)
                    return object
                }catch{
                    print("error decoding user from user defaults", error.localizedDescription)
                }
            }
        }
        return nil
    }
    
    static func == (lhs: User, rhs: User) -> Bool{
        lhs.id == rhs.id
    }
}



func saveUserLocally(_ user: User){
    let encoder = JSONEncoder()
    do{
        let data = try encoder.encode(user)
        UserDefaults.standard.set(data, forKey: kCURRENTUSER)
    }catch{
        print("error saving user locally ", error.localizedDescription)
    }
}


func createDummyUser(){
    let names = ["manu", "sneh", "mayur", "aakash", "aarav", "punit", "aditya", "uv"]
    var userIndex = 1
    
    for i in 0..<5 {
        let id = UUID().uuidString
        
        let fileDirectory = "Avatars/" + "_\(id)" + ".jpg"
        FileStorage.uploadImage(UIImage(named: "gov")!, directory: fileDirectory) { documentLink in
            let user = User(id: id, username: names[i], email: "user\(userIndex)@gmail.com", pushId: "", avatarLink: documentLink!, status:"No status")
            userIndex += 1
            
            FirebaseUserListner.shared.saveUserToFireStore(user)
        }
    }
}
