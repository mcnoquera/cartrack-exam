//
//  Extension+Request.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit
import Alamofire

extension Request {
    
    func debugLog(_ route: RequestProtocol) -> Self {
        #if DEBUG
        debugPrint("Method:     \(route.method.rawValue)")
        debugPrint("Url:        \(route.url)")
        debugPrint("Headers:    \(String(describing: route.headers))")
        debugPrint("Parameters: \(String(describing: route.parameters))")
        #endif
        return self
    }
}

