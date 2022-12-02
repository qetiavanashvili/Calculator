//
//  MathInputController.swift
//  Calc
//
//  Created by Qeti Avanashvili on 01.12.22.
//

import Foundation
struct MathInputController {
    
    // MARK: - Operand Editing Side
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    private var operandSide = OperandSide.leftHandSide
    
    
    // MARK: - Constants
    let groupingSymbol = Locale.current.groupingSeparator ?? ","
    
    // MARK: - Math Equation
    
    private(set) var mathEquation = MathEquation(lhs: .zero)
    
    
    // MARK: - LCD Display
    var lcdDisplayText = ""
    
    
    // MARK: - Initialiser
    
    init() {
        lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
    }
    
    // MARK: - Extra Functions
    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        operandSide = .rightHandSide
        
    }
    
    mutating func minusPressed() {
        mathEquation.operation = .subtract
        operandSide = .rightHandSide
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operandSide = .rightHandSide
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        operandSide = .rightHandSide
    }
    
    mutating func execute () {
        mathEquation.execute()
        
        lcdDisplayText = formatLCDDisplay(mathEquation.result)
        
    }
    // MARK: - Number Input
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }
        
        switch operandSide {
        case .leftHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.lhs)
            mathEquation.lhs = tuple.newNumber
            lcdDisplayText = tuple.newLcdDisplayText
        case .rightHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.rhs ?? .zero)
            mathEquation.rhs = tuple.newNumber
            lcdDisplayText = tuple.newLcdDisplayText
        }
    }
    
    private func appendNewNumber(_ number: Int, toPreviousInput previousInput: Decimal) -> (newNumber: Decimal, newLcdDisplayText: String) {
        let stringInput = String(number)
        var newStringRepresentation = previousInput.isZero ?  "" : lcdDisplayText
        newStringRepresentation.append(stringInput)
        
        newStringRepresentation = newStringRepresentation.replacingOccurrences(of: groupingSymbol, with: "")
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newStringRepresentation) else  { return (.nan, "Error") }
        
        let newNumber = convertedNumber.decimalValue
        let newLCDDisplayText = formatLCDDisplay(newNumber)
        return (newNumber, newLCDDisplayText)
    }
    
    // MARK: - LCD Display Formatting
    
    private func formatLCDDisplay(_ decimal: Decimal?) -> String {
        guard let decimal = decimal else { return "Error" }
        
        return decimal.formatted()
        
    }
}
