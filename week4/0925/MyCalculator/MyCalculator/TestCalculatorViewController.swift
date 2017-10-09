//
//  TestCalculatorViewController.swift
//  MyCalculator
//
//  Created by 심 승민 on 2017. 9. 20..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class TestCalculatorViewController: UIViewController {

    // MARK: - UI properties
    @IBOutlet var displayLabel: UILabel!
    
    // MARK: - Properties
    var digit: Double = 10.0
    var displayNumber: Double?{
        willSet{
            if let newVal = newValue{
                displayLabel.text = String(newVal)
            }else{
                displayLabel.text = "0"
                return
            }
        }
    }
    var waitingNumber: Double?
    var sum: Double?
    var operation: ((Double, Double)->(Double))?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBAction
    @IBAction func numberBtnClick(btn: UIButton){
        // 현재 디스플레이 라벨에 방금 누른 숫자 버튼의 이름을 노출
        if let displayNum = displayNumber{
            displayNumber = displayNum * digit + Double(btn.tag)
        }else{
            displayNumber = nil
        }
    }
    
    @IBAction func resetNumber(btn: UIButton){
        
    }
    
    @IBAction func result(btn: UIButton){
        guard let displayNum = displayNumber else{ return }
        guard let op = btn.currentTitle else{ return }
        
        switch op {
        case "+":
            operation = add
        case "-":
            operation = subtract
        case "*":
            operation = multiply
        case "/":
            operation = divide
        }
        
    }
    
    enum operations: (Double, Double)->(Double) {
        case add = {(num1, num2)->(Double) in num1 + num2}
        case subtract = {(num1, num2)->(Double) in num1 - num2}
        case multiply = {(num1, num2)->(Double) in num1 * num2}
        case divide = {(num1, num2)->(Double) in num1 / num2}
    }
    
    // MARK: - Closure
    
}
