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
    }
}

