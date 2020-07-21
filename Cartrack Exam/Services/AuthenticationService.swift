//
//  AuthenticationService.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/18/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

class AuthenticationService {

    //MARK: - Property
    private var db = SQLiteService()
    
    init() {
        self.initializedUsers()
    }
    
    //MARK: - Methods
    
    /// Initializing users.
    private func initializedUsers() {
        // Note: All declared user can be use as login authentication.
        db.insert(id: 1, "marco", "admin123".encryptText())
        db.insert(id: 2, "madison", "admin123".encryptText())
    }
    
    
    /// Authenticate user.
    /// - Parameters:
    ///   - username: String
    ///   - password: String
    /// - Returns: Bool
    func authenticate(_ username: String, _ password: String) -> Bool {
        if let _ = db.read().filter({ user in
            return user.username == username && user.password == password.encryptText()
        }).first {
            return true
        }
        return false
    }
    
}
