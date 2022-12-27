//
//  CalculatorEngineAdditionTests.swift
//  CalcTests
//
//  Created by Qeti Avanashvili on 26.12.22.
//

import XCTest
@testable import Calc

class CalculatorEngineAdditionTests: XCTestCase {
    
    func testExample() throws {
        var calculatorEngine = CalculatorEngine()
        
        calculatorEngine.pinPadPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.pinPadPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "2")
    }
    
    
    // MARK: - Equals Button
    
    func testPinPadNumberWithEquals() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
            }
        }
        
    }
    
    
    func testContinuousPinPadNumberWithEquals() throws {
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
            }
        }
        
    }
    
    // MARK: - Operation Buttons
    func testPinPadNumberByPassingEquals() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.addPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
            }
        }
    }
    
    func testContinuousPinPadNumberByPassingEquals() throws {
        
        for lhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                var result = lhsPinPadNumber
            
            for rhsPinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.addPressed()
                result = result + rhsPinPadNumber
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(result)")
            }
        }
    }
    
    
    
    
}
