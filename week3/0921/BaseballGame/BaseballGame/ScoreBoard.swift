//
//  ScoreBoard.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 25..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class ScoreBoard{
    var scoreLabel: UILabel?
    init(scoreLabel: UILabel?){
        self.scoreLabel = scoreLabel
    }
    
    
    func present(score: Score, of player: Player, erase numberBoard: NumberBoard){
        // 전광판 표시
        if score.strike == 3{
            // 3S 이면 정답 메시지 노출
            scoreLabel!.text = "정답입니다."
        }else{
            // 그 외에는 점수 노출(S, B, O)
            score.makeString(player: player)
            scoreLabel!.text = score.scoreText!
        }
        
        // 3S 인 경우, 대기중으로 변경
        if score.strike == 3{
            player.isRunning = false
        }
        
        // 다음 입력을 위해 선택넘버 초기화
        player.playerNumbers = []
        
        // 입력라벨은 초기화
        numberBoard.eraseAll()
        
    }
    
    func erase(){
        self.scoreLabel?.text = ""
    }
}
