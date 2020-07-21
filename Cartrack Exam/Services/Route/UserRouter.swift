//
//  UserRouter.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import Alamofire
import UIKit

protocol RequestProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]?  { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

enum UserRouter: RequestProtocol {
    
    case getUsers
    
    private var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    
    /// - Request URL
    var url: String {
        return ["https://jsonplaceholder.typicode.com", path].joined()
    }
    
    /// - Request Method
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }

    /// - Request Parameters
    var parameters: [String : Any]? {
        return nil
    }
    
    /// - Request ParameterEnconding
    var encoding: ParameterEncoding {
        switch self {
        case .getUsers:
            return JSONEncoding.default
        }
    }
    
    /// - Request Headers
    var headers: HTTPHeaders? {
        return nil
    }
    
}
