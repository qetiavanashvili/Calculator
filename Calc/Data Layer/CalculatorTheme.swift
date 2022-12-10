//
//  CalculatorTheme.swift
//  Calc
//
//  Created by Qeti Avanashvili on 19.11.22.
//

import Foundation

enum StatusBarStyle: Codable {
    case light
    case dark
}

struct CalculatorTheme: Codable {
    let id: String
    
    let extraFunctionColor : String
    let extraFunctionTitleColor: String
    
    let backgroundColor: String
    let displayColor: String
    
    let operationColor : String
    let operationTitleColor: String
    let operationSelectedColor : String
    let operationTitleSelectedColor: String
    
    
    let pinpadColor : String
    let pinpadTitleColor: String
    
    
    let statusBarStyle: StatusBarStyle
}
