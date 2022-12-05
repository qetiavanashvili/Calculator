//
//  MathEquation.swift
//  Calc
//
//  Created by Qeti Avanashvili on 24.11.22.
//

import Foundation
struct MathEquation {

    enum OperationType {
        case add
        case subtract
        case divide
        case multiply
    }
    
    var lhs: Decimal
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    // MARK: - Execution
    
    var executed: Bool {
        return result != nil
    }
    
    mutating func execute() {
        guard
            let rhs = self.rhs,
            let operation = self.operation else {
                return
        }
        switch operation {
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        case .multiply:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
            
            
        }
    }
    
// MARK: - Negate
    mutating func negateLeftHandSide() {
        lhs.negate()
    }
    mutating func negateRightHandSide() {
        rhs?.negate()
    }
    

    
    //MARK: - Percentage
    mutating func applyPercentageToLeftHandSide() {
        lhs = calculatorPercentageValue(lhs)
    }
    
    mutating func applyPercentageToRightHandSide() {
        guard let decimal = rhs else { return }
        rhs = calculatorPercentageValue(decimal)
    }
    
    private func calculatorPercentageValue(_ decimal: Decimal) -> Decimal {
        return decimal / 100
        
    }
    
    // MARK: - String Representation
    func generatePrintOut() -> String {
      
        let operationString = generateStringRepresentation()
        return lhs.formatted() + " " + operationString + " " + (rhs?.formatted() ?? "")
        + " = " + (result?.formatted() ?? "")
        
    }
    
    private func generateStringRepresentation() -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .none:
            return ""
        }
    }
}
