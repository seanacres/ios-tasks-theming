//
//  AppearanceHelper.swift
//  Tasks
//
//  Created by Sean Acres on 7/15/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    static var darkBlue = UIColor(red: 61.0/255.0, green: 64.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    static var beige = UIColor(red: 244.0/255.0, green: 241.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    static var greenSheen = UIColor(red: 129.0/255.0, green: 178.0/255.0, blue: 154.0/255.0, alpha: 1.0)
    
    static func breeFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        let font = UIFont(name: "Varela Round", size: pointSize)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = beige
        let textAttributes = [NSAttributedString.Key.foregroundColor: darkBlue, NSAttributedString.Key.font: breeFont(with: .largeTitle, pointSize: 40)]
        

        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = darkBlue
        
        UISegmentedControl.appearance().tintColor = darkBlue
        
        UITextField.appearance().tintColor = darkBlue
        UITextField.appearance().backgroundColor = beige
        
        UITextView.appearance().tintColor = darkBlue
        UITextView.appearance().backgroundColor = beige
        
        UILabel.appearance().textColor = darkBlue
    }
}
