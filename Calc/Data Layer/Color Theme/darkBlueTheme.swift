//
//  darkBlueTheme.swift
//  Calc
//
//  Created by iOSBFree on 24/01/2022.
//
//
//  iOSBFree Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏿 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  🤎 iOSBFree
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   💡 Team Tip 👉🏻 We can provide these files to a designer, if we wanted to.
// *******************************************************************************************

import Foundation


extension ThemeManager {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: "7",
            extraFunctionColor:                "#1D1D1D",
            extraFunctionTitleColor:                   "#727272",
            
            backgroundColor:             "#323232",
            displayColor:        "#FFFFFF",
                               
            operationColor:                 "#4566B6",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#767676",
            
            statusBarStyle: .light)
    }
}
