//
//  Extension+Optional.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

public extension Optional {
    
    func or<T>(defaultValue: T!) -> T! {
        guard let value = self else {
            return defaultValue
        }
        return (value as! T)
    }
}

public protocol Defaultable {
    static var defaultValue: Self { get }
}

public extension Optional where Wrapped: Defaultable {
    var unwrappedValue: Wrapped { return self ?? Wrapped.defaultValue }
}


extension String: Defaultable {
    public static var defaultValue: String { return "" }
}

extension Int: Defaultable {
    public static var defaultValue: Int { return 0 }
}

extension Double: Defaultable {
    public static var defaultValue: Double { return 0 }
}

extension Array: Defaultable {
    public static var defaultValue: Array<Element> { return [] }
}

extension Bool: Defaultable {
    public static var defaultValue: Bool { return false }
}
