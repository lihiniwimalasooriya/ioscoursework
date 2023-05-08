//
//  AuthManager.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-07.
//

import Foundation

final class AuthManager{
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = ""
        static let clientSecret = ""
    }
    
    private init() {}
    
    //public var signInURL: URL?{
        //url
    //}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Data? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
