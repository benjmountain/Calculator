//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var logic = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let displayedValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to Double")
            }
            return displayedValue
        } set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        logic.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = logic.calculate(method: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if (displayLabel.text == "0" || displayLabel.text == "0.0") && numValue == "." {
                    return
                } else {
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                }
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }

}

