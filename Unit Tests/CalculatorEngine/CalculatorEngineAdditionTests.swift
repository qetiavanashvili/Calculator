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
        // setup
        var calculatorEngine = CalculatorEngine()
        
        //input values
        calculatorEngine.pinPadPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.pinPadPressed(1)
        calculatorEngine.equalsPressed()
        
        
        //tests
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "2")
    }
    
}
