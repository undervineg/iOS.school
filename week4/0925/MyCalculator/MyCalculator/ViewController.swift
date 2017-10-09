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
    
    var inputText: String = "0"         // 레이블에 입력할 텍스트
    var sum: Double = 0.0               // 연산결과를 저장할 변수
    var op: String = ""                 // 전전 연산자
    var isDividedByZero: Bool = false   // 나누기 0 방지
    var isOpPressed: Bool = false       // 연산자 연속 누름 방지

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 숫자 버튼 클릭 시
    @IBAction func numberBtnClick(btn: UIButton){
        guard let btnTitleLabel = btn.titleLabel!.text else{ return }
        // 숫자버튼을 눌렀으니 연산자 버튼 플래그는 false로 바꿈
        isOpPressed = false
        
        // 옵셔널 바인딩. 디스플레이 라벨에 표시된 텍스트(수)
        if let displayLb = displayLabel.text{
            switch displayLb {
            // 0이 표시돼 있는 경우, 방금 입력한 digit 1개만 대입. ex) 0 --> 3
            case "0":
                inputText = btnTitleLabel
            // 0 외의 digit이 표시돼 있는 경우, 방금 입력한 digit을 기존 digit 옆에 붙임. ex) 13 --> 135
            default:
                inputText += btnTitleLabel
            }
        }else{ return }
        
        displayLabel.text = inputText               // 입력한 숫들을 레이블에 표시
    }
    
    // AC 버튼 클릭 시
    @IBAction func resetNumber(btn: UIButton){
        inputText = "0"
        displayLabel.text = inputText   // 현재 라벨에 0 표시
        sum = 0.0                       // 연산결과를 저장할 변수
        op = ""                         // 전전 연산자
        isDividedByZero = false         // 나누기 0 방지
        isOpPressed = false             // 연산자 연속 누름 방지
        
    }
    
    // 연산자 버튼 클릭 시(+, -, *, /, =)
    @IBAction func result(btn: UIButton){
        
        guard let displayText = displayLabel.text else{
            inputText = "오류"
            return
        }
        guard let currDisplayNum = Double(displayText) else{
            inputText = "오류"
            return
        }
        
        // 전전 연산자를 op 프로퍼티에 저장. ex) '1+2-' --> '+' 저장
        // 전전 연산자 op로 이전 sum과 현재 레이블값을 계산하여 다시 sum에 저장. ex) 1+2-3+ --> sum = 3-3
        switch op {
        case "+":
            sum += currDisplayNum
        case "-":
            sum -= currDisplayNum
        case "×":
            sum *= currDisplayNum
            break
        case "/":
            // 0 으로 나눈 경우, 에러플래그 on
            if currDisplayNum == 0{
                isDividedByZero = true
            }else{
                sum /= currDisplayNum
            }
        case "=":
            isDividedByZero = false
            isOpPressed = false
        default:
            // 이전 op가 없을 때 (즉, 최초의 op일 때)
            // sum 에 현재 레이블 값을 저장
            sum = currDisplayNum
        }
        
        
        if isDividedByZero {
            inputText = "오류!"
            isDividedByZero = false
        }else if isOpPressed{
            inputText = "오류!"
        }else{
            inputText = String(Int(sum))       // 레이블에 계산결과 표시
        }
        
        isOpPressed = true                     // 숫자 버튼이 눌리면 false, 연산자 버튼이 눌리면 true
        op = btn.currentTitle!                 // op에 방금 입력한 연산자를 저장
        displayLabel!.text = inputText         // 디스플레이 라벨에 계산결과 또는 오류 노출
        inputText = ""                         // 계산결과 리셋
    }
    
}

