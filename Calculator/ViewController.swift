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
    @IBOutlet weak var display: UILabel?
    
    var userIsInTheMiddleOfTyping = false
    
  //buttons
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
        let textCurrentlyInDisplay = display!.text!
        display!.text = textCurrentlyInDisplay + digit
        } else {
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    
}
