//
//  ViewController.swift
//  MyCalculator
//
//  Created by 심 승민 on 2017. 9. 11..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    var inputText: String = "0"     // 레이블에 입력할 텍스트
    var sum: Double = 0.0           // 연산결과를 저장할 변수
    var op: String = ""             // 이전 연산자
    var isOpPressed: Bool = false   // 연산자 플래그. 연산자 연속 입력 방지
    var isError: Bool = false       // 0으로 나누는 등 예외 방지

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberBtnClick(btn: UIButton){
        let btnTitleLabel = btn.titleLabel!.text!   // 현재 누른 숫자
        isOpPressed = false
        
        switch displayLabel.text! {
        case "0":
            inputText = btnTitleLabel
        default:
            inputText += btnTitleLabel
        }
        
        displayLabel.text = inputText               // 입력한 숫들을 레이블에 표시
    }
    
    @IBAction func resetNumber(btn: UIButton){
        displayLabel.text = "0"
        inputText = ""
    }
    
    @IBAction func result(btn: UIButton){
        // 이전 연산자를 op에 저장 ex. 1+2- 일 때, '+'를 저장
        let currDisplayNum: Double = Double(displayLabel.text!)!
        
        switch op {
        case "+":
            sum += currDisplayNum                   // 이전 sum 과 현재 레이블 을 이전 op 로 계산
            break
        case "-":
            sum -= currDisplayNum
            break
        case "×":
            sum *= currDisplayNum
            break
        case "/":
            if currDisplayNum == 0{                 // 0 으로 나눈 경우 에외 플래그 on
                isError = true
            }
            sum /= currDisplayNum
            break
        case "=":
            isError = false
            isOpPressed = false
            break
        default:                                    // 이전 op가 없을 때(최초의 op일 때)
            sum = currDisplayNum                    // sum 에 현재 레이블 값을 저장
            break
        }
        
        /*
        if op == "e"
        {
            op = btn.titleLabel!.text!                  // 현재 누른 연산자를 op에 저장
        }else
        {
            isError = true
        }
        */
        
        if isError {
            displayLabel!.text = "오류!"
            isError = false
        }else if isOpPressed {
            displayLabel!.text = "오류!"
            isOpPressed = false
        }else{
            displayLabel!.text = String(Int(sum))       // 레이블에 계산결과 표시
        }
        
        isOpPressed = true
        inputText = ""
    }
    
}

