//
//  ViewController.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 21..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    // MARK: - UI properties
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberLabel1: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    @IBOutlet weak var numberLabel3: UILabel!
    @IBOutlet weak var recordTextView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    
    
    // MARK: - Properties
    var player: Player?
    var judge: Judge?
    var generator: Generator?
    var numberBoard: NumberBoard?
    var scoreBoard: ScoreBoard?
    var recordBoard: RecordBoard?
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        judge = Judge()
        generator = Generator()
        numberBoard = NumberBoard.init(numberLabel1: numberLabel1, numberLabel2: numberLabel2, numberLabel3: numberLabel3)
        scoreBoard = ScoreBoard(scoreLabel: scoreLabel)
        recordBoard = RecordBoard(recordTextView: recordTextView)
        Util.changeLabel(label: (scoreBoard?.scoreLabel)!, msg: "Press '시작'")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - IBActions
    // 시작/초기화 버튼 클릭 시
    @IBAction func handleStartButton(_ sender: UIButton) {
        guard let player = player, let scoreBoard = scoreBoard, let recordBoard = recordBoard else{ return }
        // 대기중
        if sender.currentTitle == "시작"{
            player.gameStart(button: sender, scoreLabel: scoreLabel)
        }else if sender.currentTitle == "초기화"{   // else 안 쓰면 작동 안됨 (why?..)
            player.gameReset(button: sender, scoreBoard: scoreBoard, recordBoard: recordBoard, scoreLabel: scoreLabel, recordTextView: recordTextView)
        }
    }
    
    
    // 숫자 버튼 클릭 시 실행
    @IBAction func handleNumberButton(_ sender: UIButton) {
        guard let player = player, let numberBoard = numberBoard else{ return }
        if player.isRunning && player.playerLastIndex! < numberBoard.numberLabelsCount!{
            player.playerNumbers = numberBoard.input(aNumber: sender, in: player.playerNumbers)
            numberBoard.present(playerNumbers: player.playerNumbers, in: sender)
        }
    }
    
    
    // 확인 버튼 클릭 시 실행
    @IBAction func handleCheckButton(_ sender: UIButton) {
        guard let _ = player, let judge = judge, let scoreBoard = scoreBoard, let _ = numberBoard else{ return }
        
        print(player!.playerNumbers)
        // 게임 중이면서 입력 라벨에 넘버가 모두 입력돼 있는 경우에만 동작
        if (player?.isRunning)! && player?.playerNumbersCount! == numberBoard?.numberLabelsCount!{
            player?.tryCount += 1   // 시도 횟수++
            player?.score = judge.judge(a: player!, with: (player?.randomNumbers)!)
            scoreBoard.present(score: player!.score, of: player!, erase: numberBoard!)
            recordBoard?.present(score: player!.score, of: player!)
        }
    }
    
    
    // cancel 버튼 클릭 시 실행
    @IBAction func handleCancelButton(_ sender: UIButton) {
        guard let player = player, let numberBoard = numberBoard else{
            print("player or numberBoard: nil")
            return
        }
        
        // 취소 버튼은 게임중에만 동작함
        if player.isRunning{
            player.playerNumbers = numberBoard.eraseLastNumber(from: player.playerNumbers)
        }
    }

}

