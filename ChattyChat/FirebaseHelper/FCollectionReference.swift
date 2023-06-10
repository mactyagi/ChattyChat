//
//  FCollectionReference.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
case User
    case Recent
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
