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
        restoreSavedThemeIndex()
            
        }
        
    private func populatedArrayOfThemes() {
            themes = [darkTheme,purpleTheme,electroTheme,orangeTheme,washedOutTheme,bloodOrangeTheme,darkBlueTheme,lightBlueTheme,lightTheme,pinkTheme]
        }
    // MARK: - Save & Restore To Disk

    private func restoreSavedThemeIndex() {
        savedThemeIndex = 0
        if let previousThemeIndex = UserDefaults.standard.object(forKey: "IOSBFree.com.Calc.ThemeManager.ThemeIndex") as? Int {
            savedThemeIndex = previousThemeIndex
        }
        savedTheme = themes[savedThemeIndex]
    }
    
    private func saveThemeIndexToDisk() {
        UserDefaults.standard.set(savedThemeIndex, forKey: "IOSBFree.com.Calc.ThemeManager.ThemeIndex")
    }
    // MARK: - Next Theme

    func moveToNextTheme() {

    savedThemeIndex = savedThemeIndex + 1
    if savedThemeIndex > themes.count - 1 {
        savedThemeIndex = 0
    }
        savedTheme = themes[savedThemeIndex]
        saveThemeIndexToDisk()
    }
}
