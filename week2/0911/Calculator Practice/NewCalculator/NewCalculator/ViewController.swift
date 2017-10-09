//
//  ViewController.swift
//  NewCalculator
//
//  Created by 심 승민 on 2017. 10. 3..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets (UI)
    @IBOutlet private weak var display: UILabel!
    
    // MARK: - Properties
    private var userIsTypingDigit: Bool = false
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    // model의 일을 위임할 객체
    private var brain = CalculatorBrain()

    
    // MARK: - Actions (UI)
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay: String = display.text!
        
        if userIsTypingDigit{
            // 두 번이상 숫자버튼을 누르는 중인 경우
            display.text = textCurrentlyInDisplay + digit
        }else{
            // 숫자버튼을 처음 누른 경우
            display.text = digit
        }
        // 숫자버튼을 한 번 이상 누른 경우, userIsTyping을 true로 변경
        userIsTypingDigit = true
    }


    @IBAction private func performOperation(_ sender: UIButton) {
        guard let mathmeticalSymbol = sender.currentTitle else{
            return
        }
        
        // 숫자 버튼을 한 번도 누르지 않은 경우엔 실행하지 않음
        if userIsTypingDigit{
            // 모델(M)에서 숫자를 세팅함 (라벨에 보여지는 숫자를 double로 바꿔서)
            brain.setOperand(operand: displayValue)
            // 연산자를 누른 후에는 userIsTyping을 false로 변경
            userIsTypingDigit = false
        }
        // 연산자
        brain.performOperation(symbol: mathmeticalSymbol)
        
        displayValue = brain.result
    }
    
}

