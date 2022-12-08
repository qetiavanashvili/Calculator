//
//  ThemeManager.swift
//  Calc
//
//  Created by Qeti Avanashvili on 08.12.22.
//

import Foundation
class ThemeManager {
    
    // MARK: - Singleton
    
    static let shared = ThemeManager ()
    
    // MARK: - Themes
    
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        
        return savedTheme
    }

    // MARK: - Lifecycle
    
    init() {
        populatedArrayOfThemes()
            
        }
        
    private func populatedArrayOfThemes() {
            themes = [darkTheme,purpleTheme,electroTheme,orangeTheme,washedOutTheme,bloodOrangeTheme,darkBlueTheme,lightBlueTheme,lightTheme,pinkTheme]
        }
    }
