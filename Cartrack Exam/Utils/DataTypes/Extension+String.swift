//
//  Extension+String.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/18/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import CryptoKit
import UIKit

extension String {
    
    /// Encrypt string text
    /// - Returns: String
    func encryptText() -> String {
        return SHA256.hash(data: Data(self.utf8)).compactMap { String(format: "%02x", $0) }.joined()
    }
    
}
