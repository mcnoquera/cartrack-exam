//
//  LoginViewModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    //MARK: - Property
    lazy var authService = { [weak self] in
        return  AuthenticationService()
    }()
    
    //MARK: - Methods
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> ()) {
        completion(authService.authenticate(username, password))
    }
    
}
