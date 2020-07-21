//
//  UserListViewModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit
import ObjectMapper

class UserListViewModel: NSObject {
    
    //MARK: - Property
    private var users = [UserModel]()
    
    var numberOfRows: Int {
        return users.count
    }
    
    //MARK: - Methods
    func indexOf(at row: Int) -> UserViewModel {
        return UserViewModel(users[row])
    }
    
    /// Get Users
    func getUsers(completion: @escaping () -> ()) {
        EndpointService.shared.getUsers(route: .getUsers) {  [weak self] (response, error) in
            guard let self = self else { return }
            
            guard error == nil else {
                completion()
                return
            }
            
            if let list = response {
                self.users = Mapper<UserModel>().mapArray(JSONArray: list as! [[String : Any]])
                completion()
            } else {
                completion()
            }
        }
    }
}
