//
//  InputUser.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-17.
//

import Foundation
import Firebase

struct InputUser: Codable {
    let id: String
    var displayname: String = ""
    var username: String = ""
    var folowerscount: Double = 0
    var followingcount: Double = 0
    var createdon: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnboarded: Bool = false
    
    
    init(from user: User) {
        self.id = user.uid
    }
}
