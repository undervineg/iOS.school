//
//  Generator.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 24..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Generator{
    // 랜덤 넘버 생성 함수
    func makeRandomNumbers(maxCount: Int)->[Int]{
        var randomNumbers: [Int] = []
        
        // randomCnt 만큼만 랜덤 수 생성 (이 게임의 경우, 3개 생성)
        while randomNumbers.count < maxCount{
            // 0 ~ 9 중에서 랜덤수 뽑음
            let random: Int = Int(arc4random_uniform(10))
            // 중복 아닌 수만 저장
            while !randomNumbers.contains(random){
                randomNumbers.append(random)
            }
        }
        
        print(randomNumbers)
        return randomNumbers
    }
}
