//
//  CalculatorEngine.swift
//  Calc
//
//  Created by iOSBFree on 25/01/2022.
//
//
//  iOSBFree Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💜 iOSBFree
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's the core of the calculator. The brain. It generates all of our behaviour.
//   Architecural Layer: Business Logic Layer
//
// *******************************************************************************************


import Foundation

struct CalculatorEngine {
    
    // MARK: Input Controller
    private var inputController = MathInputController()
    
    // MARK: - Equation History
    private(set) var historyLog: [MathEquation] = []
    
    // MARK: - LCD Display
    var lcdDisplayText: String {
        return inputController.lcdDisplayText
    }
    
    
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        inputController = MathInputController()
     
    }
    
    mutating func negatePressed() {
        polulateFromResultIfNeeded()

        
        inputController.negatePressed()
    }
    
    mutating func percentagePressed() {
        polulateFromResultIfNeeded()

        
        inputController.percentagePressed()
        
    }
    
    
    
    // MARK: - Operations
    
    mutating func addPressed() {
        executeAndPopulateFromResultIfNeeded()

        
        inputController.addPressed()
    }
    
    mutating func minusPressed() {
        executeAndPopulateFromResultIfNeeded()

        
        inputController.minusPressed()
    }
    
    mutating func multiplyPressed() {
        executeAndPopulateFromResultIfNeeded()
        
        inputController.multiplyPressed()
    }
    
    mutating func dividePressed() {
        executeAndPopulateFromResultIfNeeded() 
        
        inputController.dividePressed()
    }
    
    mutating func equalsPressed() {
        if inputController.isCompleted {
            inputController = MathInputController(byPopulatingCalculationFrom: inputController)
        }
        
        
        guard inputController.isReadyToExecute else { return }
        executeMathInputController()
        ()
        
    }
    
    private mutating func executeMathInputController() {
        inputController.execute()
        historyLog.append(inputController.mathEquation)
        printEquationToDebugConsole()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        
        inputController.decimalPressed()
    }
    
    mutating func pinPadPressed(_ number: Int) {
        
        guard number >= 0,
              number <= 9 else { return }
        
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.pinPadPressed(number)
    }
    
    
    // MARK: - Populate New Math Input Controller
    
    private mutating func populateFromResult() {
        inputController = MathInputController(byPopulatingResultFrom: inputController)

    }
    
    private mutating func polulateFromResultIfNeeded() {
        if inputController.isCompleted {
            populateFromResult()
        }
    }
    
    private mutating func executeAndPopulateFromResultIfNeeded() {
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        
        polulateFromResultIfNeeded()
    }
    
    
    // MARK: - Debug Console
    private func printEquationToDebugConsole() {
        print("Equation:  " + inputController.generatePrintOut())
    }
    
    // MARK: - History Log
    private mutating func clearHistory() {
        historyLog = []
    }
    
    // MARK: - Copy & paste
    mutating func pasteInNumber(from decimal: Decimal) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        
        inputController.pasteIn(decimal)
    }
    
    mutating func pasteInMathEquation(from mathEquation: MathEquation) {
        guard let result = mathEquation.result else {
            return
        }
        
        inputController = MathInputController()
        pasteInNumber(from: result)
    }
    
}
