//
//  UpgradeCalculatorViewController.swift
//  MyCalculator
//
//  Created by 심 승민 on 2017. 9. 20..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class UpgradeCalculatorViewController: UIViewController {

    // MARK: - UI property
    @IBOutlet var displayLabel: UILabel!
    
    // MARK: - Properties
    var waitingNum: Double?
    var displayNumber: Double?{
        willSet{
            if let newVal = newValue{
                self.displayLabel.text = String(newVal)
            }else{
                self.displayLabel.text = "0"
                return
            }
        }
    }
    var digit: Double = 10.0
    var operation:((Double, Double)->(Double))?{
        didSet{
            displayNumber = nil
        }
    }
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    // 숫자 버튼 클릭 시
    @IBAction func numberBtnClick(btn: UIButton){
        let inputNum: Double = Double(btn.tag)
        
        if let newNumber = displayNumber{
            displayNumber = (newNumber * digit) + inputNum
        }else{
            displayNumber = inputNum
        }
        
    }
    
    // AC 버튼 클릭 시
    @IBAction func resetNumber(btn: UIButton){
        waitingNum = 0.0
        displayNumber = 0.0
    }
    
    
    // 연산자 버튼 클릭 시(+, -, *, /, =)
    @IBAction func result(btn: UIButton){
        guard let displayNum = displayNumber else { return }
        guard let opSymbol = btn.titleLabel?.text else{ return }
        
        switch opSymbol {
        case "+":
            operation = add
        case "-":
            operation = subtract
        case "×":
            operation = multiply
        case "/":
            operation = divide
        case "=":
            result(oper: operation, calNum: displayNum)
        default:
            break
        }
        
        waitingNum = displayNum
        //displayNumber = nil
        //self.displayLabel.text = "0"
    }
    
    func result(oper:((Double, Double)->(Double))?, calNum: Double){
        guard let waitNum = waitingNum else { return }
        if let oper = oper {
            displayNumber = oper(waitNum, calNum)
        }else{
            displayNumber = calNum
        }
    }
    
    // MARK: - Closure
    let add = {(num1: Double, num2: Double)->(Double) in num1 + num2}
    let subtract = {(num1: Double, num2: Double)->(Double) in num1 - num2}
    let multiply = {(num1: Double, num2: Double)->(Double) in num1 * num2}
    let divide = {(num1: Double, num2: Double)->(Double) in num1 / num2}
}
