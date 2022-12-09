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
    
    // MARK: - Data Storage
    private var dataStore = DataStoreManager(key: "IOSBFree.com.Calc.ThemeManager.ThemeIndex")
    
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
        restoreSavedTheme()
            
        }
        
    private func populatedArrayOfThemes() {
            themes = [darkTheme,purpleTheme,electroTheme,orangeTheme,washedOutTheme,bloodOrangeTheme,darkBlueTheme,lightBlueTheme,lightTheme,pinkTheme]
        }
    // MARK: - Save & Restore To Disk

    private func restoreSavedTheme() {
        guard let encodedtheme = dataStore.getValue() as? Data else {
            return
        }
        
       let decoder = JSONDecoder()
        if let previousTheme = try? decoder.decode(CalculatorTheme.self, from: encodedtheme) {
            savedTheme = previousTheme
        }
    }
    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(theme) {
            dataStore.set(encodedTheme)
        }
            }
    
    
    // MARK: - Next Theme

    func moveToNextTheme() {

        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > themes.count - 1 {
        savedThemeIndex = 0
        }
        let theme = themes[savedThemeIndex]
        savedTheme = theme
        saveThemeToDisk(theme)
    }
}
