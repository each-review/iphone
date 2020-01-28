//
//  CalculatorViewController.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/06.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultText: UITextField!
    
    var sum: Int? = 0
    var temp: Int? = 0
    var calNumber: Int? = 0
    var checkNumber: Bool = true
    var checkingOperator: Int = 0
    
    @IBAction func buttonTapped(sender: UIButton) {
        guard
            let buttonTitle = sender.titleLabel?.text
        else {
            return
        }
        
        
        func calculatingNumber() {
            guard let temp = temp, let sum = sum else {
                return
            }
            if buttonTitle == "=" {
                if checkingOperator == 1 {
                    calNumber = temp + sum
                    resultText.text =  String(calNumber!)
                    self.sum = calNumber!
                } else if checkingOperator == 2 {
                    calNumber = temp - sum
                    resultText.text = String(calNumber!)
                    self.sum = calNumber!
                } else if checkingOperator == 3 {
                    calNumber = (temp * sum)
                    resultText.text = String(calNumber!)
                    self.sum = calNumber!
                } else if checkingOperator == 4 {
                    calNumber = (temp / sum)
                    resultText.text = String(calNumber!)
                    self.sum = calNumber!
                }
            }
        }

        
        if checkNumber {
            if resultText.text?.first == "0" {
                if buttonTitle >= "1" && buttonTitle <= "9" {
                    resultText.text?.removeFirst()
                    resultText.text?.append(contentsOf: buttonTitle)
                    sum = Int(resultText.text!)
//                    print(sum!)
                }
            } else {
                if buttonTitle >= "0" && buttonTitle <= "9" {
                    resultText.text?.append(contentsOf: buttonTitle)
                    sum = Int(resultText.text!)
//                    print(sum!)
                }
            }
        } else {
//            operatingNumber()
            
            calculatingNumber()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}
