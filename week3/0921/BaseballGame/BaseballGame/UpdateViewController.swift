//
//  ViewController.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 21..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    // MARK: - UI properties
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var inputLb1: UILabel!
    @IBOutlet weak var inputLb2: UILabel!
    @IBOutlet weak var inputLb3: UILabel!
    @IBOutlet weak var historyLb: UITextView!
    @IBOutlet weak var startEndBtn: UIButton!
    
    
    // MARK: - Properties
    private var isRunning: Bool = false
    private var inputLbArr: [UILabel] = []
    private var randomNumberArr: [Int] = []
    private var inputNumArr: [Int] = []
    private var tryCount: Int?
    private var historyText: [String] = []
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 로드 시, 입력라벨을 순서대로 배열에 저장 ( 추후 입력숫자의 순서대로 라벨에 저장하기 위함 )
        inputLbArr = [inputLb1, inputLb2, inputLb3]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - IBActions
    // 시작/초기화 버튼 클릭 시
    @IBAction func clickStartEndBtn(_ sender: UIButton) {

        
        // 대기중
        if sender.currentTitle == "시작"{
            // 상태변경 - 게임시작
            isRunning = true
            tryCount = 0
            
            // 시작버튼 클릭 시, 버튼 라벨을 '초기화'로 변경
            changeBtn(btn: sender, btnLb: "초기화", btnColor: UIColor.darkGray)
            
            // 랜덤 배열 생성
            randomNumberArr = makeRandomNum(randomCnt: 3)
            print(randomNumberArr)
        }else if sender.currentTitle == "초기화"{   // else 안 쓰면 작동 안됨 (why?..)
            // 상태변경 - 대기중
            isRunning = false
            tryCount = 0
            
            // '초기화' 버튼을 '시작' 버튼으로 변경 및 색상 바꿈
            changeBtn(btn: sender, btnLb: "시작", btnColor: UIColor.lightGray)
            
            // 결과 라벨 및 히스토리 라벨 초기화
            resultLb.text = ""
            historyLb.text = ""
        }
        
    }
    

    // 숫자 버튼 클릭 시 실행
    @IBAction func clickNumberBtn(_ sender: UIButton) {
        
        if isRunning && inputNumArr.endIndex < inputLbArr.count{
            // 중복입력 시 알럿
            if inputNumArr.contains(sender.tag){
                presentAlert(title: "중복되는 숫자는 입력할 수 없습니다.", msg: "")
                return
            }
            
            // 입력 순서대로 배열에 저장
            inputNumArr.append(sender.tag)
            
            // 방금 입력한 수의 인덱스로 라벨 인덱스에 접근하여 숫자 저장
            // endIndex는 1,2,3 이렇게 시작되므로, 라벨 배열의 인덱스에 맞추기 위해 -1을 함
            inputLbArr[inputNumArr.endIndex-1].text = String(sender.tag)
        }
    }
    
    
    // 확인 버튼 클릭 시 실행
    @IBAction func clickCheckBtn(_ sender: UIButton) {
        // 게임 중이면서 입력 라벨에 넘버가 모두 입력돼 있는 경우에만 동작
        if isRunning && inputNumArr.count == inputLbArr.count{
            
            // 1.점수 확인  2.전광판에 점수 노출(S, B, O)  3.입력라벨 지움
            var (scoreText, score) = checkAnswer(randomNums: randomNumberArr, inputNums: inputNumArr)
            
            // 시도 횟수++
            tryCount! += 1
            
            // 3S 이면
            if score["strike"] == 3{
                // 1. 대기중으로 변경
                isRunning = false
                // 2. 전광판에 정답 메시지 노출
                resultLb.text = "정답입니다."
                // 3. 맞힌 횟수 노출
                historyLb.text! += "--->정답!\n" + String(tryCount!) + "번 만에 맞혔어요."
            }
            // 그 외에는
            else{
                // 1. 전광판에 점수 노출(S, B, O)
                resultLb.text = scoreText
                // 2. 히스토리 작성
                historyLb.text! += "\n" + scoreText
            }
            
            // 입력 라벨을 지움
            inputNumArr = []
            inputLb1.text = ""
            inputLb2.text = ""
            inputLb3.text = ""
        }
    }
    
    
    // cancel 버튼 클릭 시 실행
    @IBAction func clickCancelBtn(_ sender: UIButton) {
        // 취소 버튼은 게임중에만 동작함
        if isRunning{
            // 마지막 입력 넘버를 제거
            inputNumArr.removeLast()
            // 마지막 입력 넘버를 라벨에서 제거 (위에서 한 개를 지웠으므로 endIndex에 -1 안해도 됨)
            inputLbArr[inputNumArr.endIndex].text = ""
        }
    }
    
    
    
    // MARK: - Functions
    // 랜덤 넘버 생성 함수
    private func makeRandomNum(randomCnt: Int)->[Int]{
        var arr: [Int] = []
        
        // randomCnt 만큼만 랜덤 수 생성 (이 게임의 경우, 3개 생성)
        while arr.count < randomCnt{
            // 0 ~ 9 중에서 랜덤수 뽑음
            let random: Int = Int(arc4random_uniform(10))
            // 중복 아닌 수만 저장
            while !arr.contains(random){
                arr.append(random)
            }
        }
        return arr
    }
    
    
    // 상태에 따른 버튼 변경
    private func changeBtn(btn: UIButton, btnLb: String, btnColor: UIColor){
        btn.setTitle(btnLb, for: UIControlState.normal) // 버튼 명
        btn.backgroundColor = btnColor                  // 버튼 색상
    }
    
    
    // 알럿 노출 함수
    private func presentAlert(title: String, msg: String){
        // 알럿 본체 생성
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        // 알럿에 붙일 액션 생성 (확인 액션만 만듦)
        let alertaction = UIAlertAction(title: "확인", style: .default, handler: nil)
        // 알럿 본체에 액션 붙임
        alert.addAction(alertaction)
        // 알럿 노출
        present(alert, animated: true, completion: nil)
    }
    
    
    // 스코어 반환 함수
    private func checkAnswer(randomNums: [Int], inputNums: [Int]) -> (String, [String:Int]){
        var score: [String:Int] = ["strike": 0, "ball": 0, "out": 0]
        var scoreText: String = ""
        
        // 랜덤넘버와 입력넘버를 비교하여 Dictionary의 각 키값에 저장
        for elem in inputNums{
            // 입력넘버가 랜덤넘버에 있으면 S 또는 B
            if randomNums.contains(elem){
                // 입력넘버의 위치와 랜덤넘버의 위치가 같으면 S
                if inputNums.index(of: elem) == randomNums.index(of: elem){
                    score["strike"]! += 1
                    // 입력넘버의 위치와 랜덤넘버의 위치가 다르면 B
                }else{
                    score["ball"]! += 1
                }
                // 입력넘버가 랜덤넘버에 없으면 O
            }else{
                score["out"]! += 1
            }
        }
        
        // 문자열로 점수를 넣어 전달
        if score["strike"]! > 0 {
            scoreText += "S" + String(describing: score["strike"]!) + " "
        }
        if score["ball"]! > 0 {
            scoreText += "B" + String(describing: score["ball"]!) + " "
        }
        if score["out"]! > 0 {
            scoreText += "O" + String(describing: score["out"]!)
        }
        
        return (scoreText, score)
    }
}

