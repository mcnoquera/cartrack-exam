//
//  CTGenericViewModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

class CTGenericViewModel<T: NSObject>: NSObject {
    
    var model: T!
    override init() {}
    init(_ model: T?) {
        self.model = model.or(defaultValue: T())
    }
    
}

