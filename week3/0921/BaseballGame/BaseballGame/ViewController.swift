//
//  ViewController.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 21..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI properties
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var inputLb1: UILabel!
    @IBOutlet weak var inputLb2: UILabel!
    @IBOutlet weak var inputLb3: UILabel!
    @IBOutlet weak var historyLb: UITextView!
    @IBOutlet weak var startEndBtn: UIButton!
    
    // MARK: - Properties
    private var isRunning: Bool = false
    private var inputLbArr: [UILabel]?
    private var randomNumberArr: [Int]?
    private var inputNum: Int?
    private var inputNumArr: [Int]?
    private var strike: Int?
    private var ball: Int?
    private var out: Int?
    private var inputCnt: Int?
    private var historyText: String?
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputLbArr = [inputLb1, inputLb2, inputLb3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBActions
    // 숫자 버튼
    @IBAction func clickNumberBtn(_ sender: UIButton) {
        guard let inputNumberArr = inputNumArr, let inputLabelArr = inputLbArr else { return }
        
        // 선택한 숫자버튼의 태그
        inputNum = sender.tag
        
        // 게임 진행중인 경우 및 3번 누를 때까지만 동작. 중복숫자는 입력안됨
        if inputNumberArr.contains(inputNum!){
            let repeatedNumAlert = UIAlertController(title: "중복 숫자를 입력하셨습니다", message: "", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "확인", style: .default, handler: nil)
            repeatedNumAlert.addAction(alertaction)
            present(repeatedNumAlert, animated: true, completion: nil)
        }else if isRunning && inputNumberArr.endIndex < inputLabelArr.count {
            inputNumArr?.append(inputNum!)
            let lastIdx: Int = inputNumberArr.endIndex
            inputLabelArr[lastIdx].text = String(inputNum!)
        }
    }
    
    // 확인 버튼
    @IBAction func clickCheckBtn(_ sender: UIButton) {
        guard let inputNumberArr = inputNumArr, let randomNumberArr = randomNumberArr else{
            print("nil")    // nil을 꼭 찍어보자. 뭐가 초기화가 안 되었는지..
            return
        }
        // 현재 입력한 수가 3개인 경우에만 하단 구문 실행
        guard inputNumArr!.count == 3 else{ return }
        
        inputCnt! += 1      // 몇 번만에 성공했는지 체크하기 위함
        print(randomNumberArr)
        print(inputNumberArr)
        
        
        for elem in inputNumberArr{
            if randomNumberArr.contains(elem){
                if inputNumberArr.index(of: elem) == randomNumberArr.index(of: elem){
                    strike! += 1
                }else{
                    ball! += 1
                }
            }else{
                out! += 1
            }
        }
        
        if strike! == 3{
            isRunning = false
            let successAlert = UIAlertController(title: "3 Strike! 짝짝짝!", message: "\(inputCnt!)번 만에 성공했습니다.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "확인", style: .default, handler: {action in
                // 알럿의 '확인' 버튼 누른 후 실행되는 구문
                // 결과 라벨 초기화
                self.resultLb.text = ""
                // '초기화' 버튼을 '시작' 버튼으로 변경 및 색상 바꿈
                self.startEndBtn.setTitle("시작", for: UIControlState.normal)
                self.startEndBtn.backgroundColor = UIColor.lightGray
                self.inputCnt = 0
                self.isRunning = false
                self.historyText = ""
                self.historyLb.text = ""
            })
            successAlert.addAction(alertAction)
            present(successAlert, animated: true, completion: nil)
        }
        print("input count: \(inputCnt!)")
        print("strike: \(strike!), ball: \(ball!), out: \(out!)")
        
        resultLb!.text! = "S\(strike!), B\(ball!), O\(out!)"
        historyText! += "\(inputCnt!)회------------------------\n \(resultLb!.text!)\n"
        historyLb.text = historyText
        
        // 입력한 라벨을 지움
        inputNumArr = []
        inputLb1.text = ""
        inputLb2.text = ""
        inputLb3.text = ""
        // 이번 입력결과를 초기화
        strike = 0
        ball = 0
        out = 0
    }
    
    // cancel 버튼 클릭 시
    @IBAction func clickCancelBtn(_ sender: UIButton) {
        if isRunning{
            // 현재까지 입력된 수만 돌면서
            for i in 0..<inputLbArr!.endIndex{
                // 가장 마지막 수를 꺼냄
                //inputNumArr!.popLast()
                inputNumArr!.remove(at: inputNumArr!.endIndex)
                
                // 라벨 지움
                inputLbArr![i].text = ""
            }
        }
    }
    
    // 시작/초기화 버튼 클릭 시
    @IBAction func clickStartEndBtn(_ sender: UIButton) {
        if sender.currentTitle == "시작"{
            // 게임 시작 상태 변경
            isRunning = true
            inputNumArr = []
            randomNumberArr = []
            strike = 0
            ball = 0
            out = 0
            inputCnt = 0
            historyText = ""
            
            // 시작버튼 클릭 시, 버튼 라벨을 '초기화'로 변경
            sender.setTitle("초기화", for: UIControlState.normal)
            sender.backgroundColor = UIColor.darkGray
            randomNumberArr = makeRandomNum(randomCnt: 3)
        }else if sender.currentTitle == "초기화"{
            isRunning = false
            strike = 0
            ball = 0
            out = 0
            inputCnt = 0
            historyText = ""
            historyLb.text = ""
            // 결과 라벨 초기화
            resultLb.text = ""
            // '초기화' 버튼을 '시작' 버튼으로 변경 및 색상 바꿈
            startEndBtn.setTitle("시작", for: UIControlState.normal)
            startEndBtn.backgroundColor = UIColor.lightGray
        }
    }

    // MARK: - Functions
    private func makeRandomNum(randomCnt: Int)->[Int]{
        // 중복없는 3자리 수 반환
        var arr: [Int] = []
        
        while arr.count < randomCnt{
            let random: Int = Int(arc4random_uniform(10))
            while !arr.contains(random){
                arr.append(random)
            }
        }
        
        return arr
    }
}

