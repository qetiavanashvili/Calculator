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
    
    private var savedThemeIndex = 0
    
    
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


    // MARK: - Next Theme

    func moveToNextTheme() {

    savedThemeIndex = savedThemeIndex + 1
    if savedThemeIndex > themes.count - 1 {
        savedThemeIndex = 0
    }
        savedTheme = themes[savedThemeIndex]
    }
}
