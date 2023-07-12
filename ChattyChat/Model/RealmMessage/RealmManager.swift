//
//  RealmManager.swift
//  ChattyChat
//
//  Created by Manu on 15/06/23.
//

import Foundation
import RealmSwift

class RealmManager{
    static let shared = RealmManager()
    let realm = try! Realm()
    private init(){ }
    
    func saveToRealm<T: Object>(_ object: T){
        do{
            try realm.write({
                realm.add(object, update: .all)
            })
        }catch{
            print("error saving realm Object ", error.localizedDescription)
        }
    }
}
