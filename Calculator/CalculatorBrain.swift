//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by mateusz on 08.08.2017.
//  Copyright © 2017 mateusz. All rights reserved.
//  model file!

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation
        case binaryOperation
    }
    
    private var operations: Dictionary<String,Operation> = [
        "pi"    :   Operation.constant(Double.pi), //Double.pi,
        "e"     :   Operation.constant(M_E), //M_E,
        "√"     :   Operation.unaryOperation, //sqrt,
        "cos"   :   Operation.unaryOperation, //cos,
    
    ]
    
    mutating func performOperation(_ symbol: String) {
        
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation:
                break
            case .binaryOperation:
                break
            }
        }
        /*
        switch symbol {
        case "pi": accumulator = Double.pi
        case "√" :
            if let operand = accumulator {
            accumulator = sqrt(operand)
            }
            
        default:
            break
         */
        
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
