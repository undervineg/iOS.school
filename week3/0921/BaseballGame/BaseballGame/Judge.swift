//
//  Judge.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 24..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Judge{
    // 스코어 반환 함수
    func judge(a player: Player, with randomNumbers: [Int])->Score{
        let score: Score = Score()
        
        // 랜덤넘버와 입력넘버를 비교하여 Dictionary의 각 키값에 저장
        for elem in player.playerNumbers!{
            // 입력넘버가 랜덤넘버에 있으면 S 또는 B
            if randomNumbers.contains(elem){
                // 입력넘버의 위치와 랜덤넘버의 위치가 같으면 S
                if player.playerNumbers!.index(of: elem) == randomNumbers.index(of: elem){
                    score.strike! += 1
                    // 입력넘버의 위치와 랜덤넘버의 위치가 다르면 B
                }else{
                    score.ball! += 1
                }
                // 입력넘버가 랜덤넘버에 없으면 O
            }else{
                score.out! += 1
            }
        }
        
        print("strike: ", score.strike!)
        print("ball: ", score.ball!)
        print("out: ", score.out!)
        
        return score
    }
}
