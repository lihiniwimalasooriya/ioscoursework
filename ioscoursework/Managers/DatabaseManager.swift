//
//  DatabaseManager.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-18.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine



class DatabaseManager {
    
    static let shared = DatabaseManager()
    

    let db = Firestore.firestore()
    let usersPath: String = "users"
    
    func collectionUsers(add user: User) -> AnyPublisher<Bool, Error> {
        let inputUser = InputUser(from: user)
        return db.collection(usersPath).document(inputUser.id).setData(from: inputUser)
            .map { _ in
                return true
            }
            .eraseToAnyPublisher()
    }
}
