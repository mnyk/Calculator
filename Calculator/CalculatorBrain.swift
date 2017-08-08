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
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
        case "pi": accumulator = Double.pi
        case "√" :
            if let operand = accumulator {
            accumulator = sqrt(operand)
            }
        default:
            break
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
