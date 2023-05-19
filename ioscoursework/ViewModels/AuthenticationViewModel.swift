//
//  AuthenticationViewModel.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-18.
//

import Foundation
import Firebase
import Combine

final class AuthenticationViewModel: ObservableObject{
    
    @Published var user: User?
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func createRecord(for user: User){
        DatabaseManager.shared.collectionUsers(add: user)
            .sink{ [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { state in
                print("Adding user records to database: \(state)")
            }
            .store(in: &subscriptions)
    }
}
