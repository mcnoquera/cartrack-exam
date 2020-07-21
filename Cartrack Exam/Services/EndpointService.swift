//
//  EndpointService.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit
import Alamofire

public typealias ResultBlock = (_ type: Any?, _ error: AFError?) -> Void

protocol EndpointServiceProtocol {
    static var shared: EndpointService { get }
    func request(route: RequestProtocol, completion: @escaping ResultBlock)
    
    // : -  Get Users Endpoint
    func getUsers(route: UserRouter, completion: @escaping ResultBlock)
}

class EndpointService: EndpointServiceProtocol {
    
    static var shared: EndpointService {
        return EndpointService()
    }
        
    
    /// Request Service
    /// - Parameters:
    ///   - route: RequestProtocol
    ///   - completion: Any(Optional) and  Error
    func request(route: RequestProtocol, completion: @escaping ResultBlock) {
        AF.request(route.url, method: route.method, parameters: route.parameters, encoding: route.encoding, headers: route.headers)
            .debugLog(route)
            .responseJSON { response in
                #if DEBUG
                debugPrint("Response:     \(String(describing: response.value))")
                debugPrint("Error:        \(String(describing: response.error?.localizedDescription))")
                #endif
                completion(response.value, response.error)
        }
    }
}


extension EndpointService {
    
    /// Get User Endpoint
    /// - Parameters:
    ///   - route: User Router
    ///   - completion: Any(Optional) and  Error
    func getUsers(route: UserRouter, completion: @escaping ResultBlock) {
        request(route: route) {[weak self] (response, error) in
            guard self == nil else { return }
            completion(response, error)
        }
    }
    
}
