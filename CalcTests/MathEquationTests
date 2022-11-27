//
//  MathEquationTests
//  CalcTests
//
//  Created by Qeti Avanashvili on 15.11.22.
//

import XCTest
@testable import Calc

 class MathEquationTests: XCTestCase {
    
    
    
    func testAddition() throws {
        var mathEquation = mathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .add
        mathEquation.rhs = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(8)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
    func testSubtract() throws {
        var mathEquation = mathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .subtract
        mathEquation.rhs = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(0)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
        
    }
    
    
    func testMultiplication() throws {
        var mathEquation = mathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .multiply
        mathEquation.rhs = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(16)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
    func testDivide() throws {
        var mathEquation = mathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .divide
        mathEquation.rhs = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(1)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
     
}
