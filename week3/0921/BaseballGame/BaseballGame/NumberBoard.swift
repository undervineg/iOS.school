//
//  NumberBoard.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 25..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class NumberBoard{
    private var numberLabels: [UILabel]
    var numberLabelsCount: Int?{
        get{ return numberLabels.count }
    }
    
    
    init(numberLabel1: UILabel, numberLabel2: UILabel, numberLabel3: UILabel){
        self.numberLabels = [numberLabel1, numberLabel2, numberLabel3]
    }
    
    func input(aNumber pressedNumber: UIButton, in playerNumbers: [Int])->[Int]{
        var playerNumbers = playerNumbers
        
        // 중복이 아닌 수만 배열에 저장
        if !playerNumbers.contains(pressedNumber.tag){
            // 입력 순서대로 배열에 저장
            playerNumbers.append(pressedNumber.tag)
        }
        
        return playerNumbers
    }
    
    func present(playerNumbers: [Int], in pressedNumber: UIButton){
        // 방금 입력한 수의 인덱스로 라벨 인덱스에 접근하여 숫자 저장
        // endIndex는 1,2,3 이렇게 시작되므로, 라벨 배열의 인덱스에 맞추기 위해 -1을 함
        numberLabels[playerNumbers.endIndex-1].text = String(pressedNumber.tag)
    }
    
    func eraseLastNumber(from playerNumbers: [Int])->[Int]{
        // 마지막 입력 넘버를 배열에서 제거
        var playerNumbers = playerNumbers
        playerNumbers.removeLast()
        // 마지막 입력 넘버를 라벨에서 제거 (위에서 한 개를 지웠으므로 endIndex에 -1 안해도 됨)
        numberLabels[playerNumbers.endIndex].text = ""
        return playerNumbers
    }
    
    func eraseAll(){
        for label in self.numberLabels{
            label.text = ""
        }
    }
}
