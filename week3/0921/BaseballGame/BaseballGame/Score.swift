//
//  Score.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 24..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Score{
    var strike: Int?
    var ball: Int?
    var out: Int?
    var scoreText: String?
    
    init(){
        self.strike = 0
        self.ball = 0
        self.out = 0
        self.scoreText = ""
    }
    
    func makeString(player: Player){
        // 문자열로 점수를 넣어 전달
        if self.strike! > 0 {
            self.scoreText! += "S" + String(describing: self.strike!) + " "
        }
        if self.ball! > 0 {
            self.scoreText! += "B" + String(describing: self.ball!) + " "
        }
        if self.out! > 0 {
            self.scoreText! += "O" + String(describing: self.out!)
        }
    }
}
