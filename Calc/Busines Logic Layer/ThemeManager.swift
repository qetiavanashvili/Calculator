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
    private var dataStore = DataStoreManager(key: ThemeManager.keys.dataStore)
    
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
        
        // index of saved theme
        let currentThemeID = currentTheme.id
        let index: Int? = themes.firstIndex { CalculatorTheme in
            CalculatorTheme.id == currentThemeID
        }
        
        // reset if something has gone wrong
        guard let indexOfExistingTheme = index else {
            if let firstTheme = themes.first {
                updateSystemWithTheme(firstTheme)
            }
            return
        }
        
        // move to next theme
        var nextThemeIndex = indexOfExistingTheme + 1
        if nextThemeIndex > themes.count - 1 {
            nextThemeIndex = 0
        }
        
        // set the theme
        guard let theme = themes[safe: nextThemeIndex] else {
            return
        }
        updateSystemWithTheme(theme)
    }
    
    private func updateSystemWithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk(theme)
    }
}

