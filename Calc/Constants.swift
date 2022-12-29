//
//  Constants.swift
//  Calc
//
//  Created by Qeti Avanashvili on 29.12.22.
//

import Foundation
import UIKit


// MARK: - UIImage
extension UIImage {
    struct keys {
        static let circleSliced = "CircleSliced"
        static let circle = "Circle"
    }
}

// MARK: - LCDDisplay
extension LCDDisplay {
    struct keys {
        static let historyLogNotification = "iOSBFree.com.calc.LCDDisplay.displayHistory"
        static let pasteNumberNotification = "iOSBFree.com.Calc.LCDDisplay.pasteNumber"
        static let pasteNumberKey = "PasteKey"
        
    }
}


// MARK: - LogViewController

extension LogViewController {
    struct keys {
        static let pasteEquationNotification = "iOSBFRee.com.Calc.LogViewController.pasteMathEquation"
        
        static let pasteNumberKey = "PasteKey"
    }
}


// MARK: - UIStoryBoard
extension UIStoryboard {
    struct keys {
        static let mainStoryboard = "Main"
        static let logViewController = "LogViewController"
        
    }
}

    // MARK: - ThemeManager
extension ThemeManager {
    struct keys {
        static let dataStore = "IOSBFree.com.Calc.ThemeManager.ThemeIndex"
    }
}
