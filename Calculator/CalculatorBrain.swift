//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by mateusz on 08.08.2017.
//  Copyright © 2017 mateusz. All rights reserved.
//  model file!

import Foundation

/*func changeSign(operand: Double) -> Double {
    return -operand
}

func multiply(op1: Double, op2: Double) ->Double {
    return op1*op2
}*/

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "pi"    :   Operation.constant(Double.pi), //Double.pi,
        "e"     :   Operation.constant(M_E), //M_E,
        "√"     :   Operation.unaryOperation(sqrt), //sqrt,
        "cos"   :   Operation.unaryOperation(cos), //cos,
        "±"     :   Operation.unaryOperation({ -$0}),
        "x"     :   Operation.binaryOperation({$0 * $1}),
        "÷"     :   Operation.binaryOperation({$0 / $1}),
        "+"     :   Operation.binaryOperation({$0 + $1}),
        "-"     :   Operation.binaryOperation({$0 - $1}),
        "="     :   Operation.equals
        
    ]
    
    mutating func performOperation(_ symbol: String) {
        
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
       
    }
    
    
    private mutating func performPendingBinaryOperation(){
        if pendingBinaryOperation != nil && accumulator != nil{
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?

    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double{
            return function(firstOperand, secondOperand)
        }
    }
    
    
    mutating func setOperand(_ operand: Double){
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
