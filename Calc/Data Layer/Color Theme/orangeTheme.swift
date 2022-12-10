//
//  orangeTheme.swift
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
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme(id:          "10",
                               extraFunctionColor:                "#DC6969",
                               extraFunctionTitleColor:                   "#ffffff",
                               
                               backgroundColor:             "#D05353",
                               displayColor:        "#ffffff",
                               
            operationColor:                 "#CC4D4D",
            operationTitleColor:            "#ffffff",
            operationSelectedColor:         "#AB2F2F",
            operationTitleSelectedColor:    "#ffffff",
                               
            pinpadColor:                    "#C94848",
            pinpadTitleColor:               "#ffffff",
                               
            statusBarStyle:                 .light)
    }
}
