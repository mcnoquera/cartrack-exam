//
//  Extension+NSCoding.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

extension NSCoding {
    func encodeObject(_ aCoder: NSCoder, model: Any) {
        aCoder.encode(model, forKey: "\(Mirror(reflecting: self).subjectType)")
    }
    
    func decodeObject(_ aDecoder: NSCoder) -> Any {
        return aDecoder.decodeObject(forKey: "\(Mirror(reflecting: self).subjectType)") as Any
    }
}
