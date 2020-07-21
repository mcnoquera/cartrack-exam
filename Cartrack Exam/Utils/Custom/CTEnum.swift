//
//  CTEnum.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

enum CTEnum {

    
    /// Storyboard
    enum Storyboard: String {
        case Main
        
        var instance: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        }
        
        func viewController<T: UIViewController>(_ viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
            let storyboardId = (viewControllerClass as UIViewController.Type).storyboardId
            guard let scene = instance.instantiateViewController(identifier: storyboardId) as? T else {
                fatalError("ViewController with identifier \(storyboardId), not found in \(self.rawValue) Storyboard.\nFile: \(file) \nLine Number: \(line) \nFunction: \(function)")
            }
            return scene
        }
        
        func initViewController() -> UIViewController? {
            return instance.instantiateInitialViewController()
        }
    }
    
}
