//
//  FirebaseUserListners.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import Foundation
import Firebase


class FirebaseUserListner {
    static let shared = FirebaseUserListner()
    private init() {}
    
    //MARK: - Login
    
    func loginUserWithEmail(email: String, password: String, completion: @escaping (_ error:Error?, _ isEmailVerified: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if error == nil && authDataResult!.user.isEmailVerified{
                self.downloadUserFromFirebase(userId: authDataResult!.user.uid)
                completion(error, true)
            }else{
                print("email is not verified")
                completion(error, false)
            }
        }
    }
    
    //MARK: - Register
    
    func registerUserWith(email: String, password: String, completion: @escaping(_ error: Error?) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { data, error in
            completion(error)
            if error == nil{
                data!.user.sendEmailVerification { error in
                    print("auth email sent wirth error: ", error?.localizedDescription)
                }
                
                // create user and save it
                if data?.user != nil{
                    let user = User(id: data!.user.uid, username: email, email: email, pushId: "", avatarLink: "", status: "Hey there I'm using chattyChat.")
                    
                    saveUserLocally(user)
                    self.saveUserToFireStore(user)
                }
            }
        }
    }
    
    
    func resendVerificationEmail(email: String, completion: @escaping (_ error: Error?) -> Void){
        Auth.auth().currentUser?.reload(completion: { error in
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                completion(error)
            })
        })
    }
    
    
    func resetPasswordFor(email: String, completion: @escaping(_ error: Error?) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    
    func logoutCurrentUser(completion: @escaping (_ error: Error?) -> Void){
        do{
           try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: kCURRENTUSER)
            UserDefaults.standard.synchronize()
            completion(nil)
        }catch{
            completion(error)
        }
    }
    
    func saveUserToFireStore(_ user: User){
        do{
            try FirebaseReference(.User).document(user.id).setData(from: user)
        }catch{
            print((error.localizedDescription, "adding user"))
        }
    }
    
    
    func downloadUserFromFirebase(userId: String, email: String? = nil){
        FirebaseReference(.User).document(userId).getDocument { querySnapshot, error in
            guard let document = querySnapshot else{
                print("no document for user")
                return
            }
            
            let result = Result{
                try? document.data(as: User.self)
            }
            
            switch result {
            case .success(let userObj):
                if let user = userObj{
                    saveUserLocally(user)
                }else{
                    print("Document does not exist")
                }
            case .failure(let error):
                print("error decoding user", error.localizedDescription)
            }
        }
    }
}
