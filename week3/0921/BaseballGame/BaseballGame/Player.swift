//
//  Player.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 24..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class Player{
    let util: Util?
    var isRunning: Bool?
    var tryCount: Int?
    var playerNumbers: [Int]?
    var playerNumbersCount: Int?{
        get{ return playerNumbers?.count }
    }
    var playerLastIndex: Int?{
        guard let playerNumbers = self.playerNumbers else { return 0 }
        return playerNumbers.endIndex
    }
    var randomNumbers: [Int]?
    var randomNumbersCount: Int?{
        get{ return self.randomNumbers?.count }
    }
    var score: Score?
    
    init(){
        // init에서 연산프로퍼티에 값을 넣는 일은 하지 않는다. (무한 루프)
        // 위에 선언한 옵셔널 변수들도 초기화를 꼭 시켜준다.
        self.util = Util()
        self.isRunning = false
        self.tryCount = 0
        playerNumbers = []
        randomNumbers = []
        score = Score()
    }
    
    
    // 게임 시작
    func gameStart(button: UIButton, scoreLabel: UILabel){
        // 상태변경 - 게임시작
        isRunning = true
        tryCount = 0
        
        // 시작버튼 클릭 시, 버튼 라벨을 '초기화'로 변경. 스코어라벨에 있는 디폴트 문구 지움
        util!.changeButton(btn: button, btnLabel: "초기화", btnColor: UIColor.darkGray)
        util!.changeLabel(label: scoreLabel, msg: "")
        
        // 랜덤 배열 생성 및 정답 디버깅프린트
        let generator = Generator()
        self.randomNumbers = generator.makeRandomNumbers(maxCount: 3)
    }
    
    // 게임 초기화
    func gameReset(button: UIButton, scoreBoard: ScoreBoard, recordBoard: RecordBoard, scoreLabel:  UILabel?, recordTextView: UITextView?){
        // 상태변경 - 대기중
        isRunning = false
        tryCount = 0
        
        // '초기화' 버튼을 '시작' 버튼으로 변경 및 색상 바꿈. 스코어라벨에 디폴트 문구 다시 삽입
        util!.changeButton(btn: button, btnLabel: "시작", btnColor: UIColor.lightGray)
        util!.changeLabel(label: scoreLabel!, msg: "Press '시작'")
        
        // 결과 라벨 및 히스토리 라벨 초기화
        scoreBoard.erase()
        recordBoard.erase()
    }
    
}
