//
//  CalculatorEngineEqualsTests.swift
//  CalcTests
//
//  Created by Qeti Avanashvili on 28.12.22.
//

import XCTest
@testable import Calc

class CalculatorEngineEqualsTests: XCTestCase {
    
    func testContinuousEqualsWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                var expectedResult = Decimal(lhsPinPadNumber + rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
               
                for _ in 1...10 {
                    
                    calculatorEngine.equalsPressed()
                    expectedResult = expectedResult + Decimal(rhsPinPadNumber)
                    XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                    
                }
                
            }
        }
        
    }
    
    
    func testContinuousEqualsWithASubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                var expectedResult = Decimal(lhsPinPadNumber - rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
               
                for _ in 1...10 {
                    
                    calculatorEngine.equalsPressed()
                    expectedResult = expectedResult - Decimal(rhsPinPadNumber)
                    XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                    
                }
                
            }
        }
        
    }
    func testContinuousEqualsWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                var expectedResult = Decimal(lhsPinPadNumber * rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
               
                for _ in 1...10 {
                    
                    calculatorEngine.equalsPressed()
                    expectedResult = expectedResult *  Decimal(rhsPinPadNumber)
                    XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                    
                }
                
            }
        }
        
    }
    
    func testContinuousEqualsWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                var expectedResult = Decimal(lhsPinPadNumber) / Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
               
                for _ in 1...10 {
                    
                    calculatorEngine.equalsPressed()
                    expectedResult = expectedResult / Decimal(rhsPinPadNumber)
                    XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                    
                }
                
            }
        }
        
    }
    
    
}
