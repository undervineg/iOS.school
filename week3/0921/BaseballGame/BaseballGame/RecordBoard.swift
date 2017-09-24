//
//  RecordBoard.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 25..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class RecordBoard{
    var recordTextView: UITextView?
    
    init(recordTextView: UITextView?){
        self.recordTextView = recordTextView
    }
    
    func present(score: Score, of player: Player) {
        // 히스토리 전광판에 표시
        if score.strike! == 3{
            // 3S 이면 맞힌 횟수 노출
            self.recordTextView!.text! += "정답!\n" + String(player.tryCount!) + "번 만에 맞혔어요."
        }else{
            // 그 외에는 히스토리 쌓음
            self.recordTextView!.text! += "\n" + score.scoreText!
        }
    }
    
    func erase(){
        self.recordTextView?.text = ""
    }
}
