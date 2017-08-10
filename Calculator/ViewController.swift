//
//  ViewController.swift
//  Calculator
//
//  Created by mateusz on 07.08.2017.
//  Copyright © 2017 mateusz. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    //display
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    var decimalUsed = false
    
    //buttons
    @IBAction func touchDigit(_ sender: UIButton) {
       
            let digit = sender.currentTitle!

            
            if userIsInTheMiddleOfTyping {
                if digit == "." && decimalUsed == true {
                    return
                } else if digit == "." && decimalUsed == false {
                    decimalUsed = true
            }
        
        
       
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
            userIsInTheMiddleOfTyping = true
        
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
        
    }
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
            
        }
        if let mathematicalSymbol = sender.currentTitle{
             brain.performOperation(mathematicalSymbol)           }
        if let result = brain.result{
            
        
            displayValue = result
        }
        }
    }
    

