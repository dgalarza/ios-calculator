//
//  ViewController.swift
//  Calculator
//
//  Created by Damian Galarza on 4/10/15.
//  Copyright (c) 2015 thoughtbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping: Bool = false
    var operands = [Double]()
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            println(newValue)
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    @IBAction func inputDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            userIsTyping = true
            display.text = digit
        }
    }
    
    @IBAction func reset() {
        userIsTyping = false
        display.text = "0"
        operands = [Double]()
    }
    
    @IBAction func enter() {
        operands.append(displayValue)
        userIsTyping = false
    }
    
    @IBAction func calculate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userIsTyping {
            enter()
        }
        
        switch operation {
        case "✖️": performCalculation { $0 * $1 }
        case "➗": performCalculation { $1 / $0 }
        case "➕": performCalculation { $0 + $1 }
        case "➖": performCalculation { $1 - $0 }
        default: enter()
        }
    }
    
    func performCalculation(calculation: (Double, Double) -> Double) {
        if operands.count >= 2 {
            displayValue = calculation(operands.removeLast(), operands.removeLast())
            enter()
        }
    }
}