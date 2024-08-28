//
//  AuthenticationManager.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Anil Gupta on 23/08/24.
//

import Foundation
import FirebaseAuth

//model file

struct AuthDataResultModel{
    let uid : String
    let email : String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
    
}

final class AuthenticationManager{
    
    //singleton class
    static let shared = AuthenticationManager()
    
    private init(){
        
    }
    
    //get current user
    func getCurrentAuthenticatedUser() throws -> AuthDataResultModel{
        guard let currentUser = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: currentUser)
    }
    
    
    
    //create user
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return AuthDataResultModel(user: authResult.user)
    }
    
    func signOut() throws{
        try? Auth.auth().signOut()
    }
    
    
    
}
