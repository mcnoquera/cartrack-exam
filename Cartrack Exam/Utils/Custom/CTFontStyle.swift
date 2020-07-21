//
//  CTFontStyle.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

enum CTFontStyle: String {

    case helveticaNeueBold = "HelveticaNeue-Bold"
    case helveticaNeueRegular = "HelveticaNeue-Regular"

   
    func ofSize(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: self.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
   
    func defaultSize() -> UIFont {
        return self.ofSize(size: 14)
    }
    
}
