//
//  Util.swift
//  BaseballGame
//
//  Created by 심 승민 on 2017. 9. 25..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class Util{ // 이런 클래스의 함수들은 class 함수나 static 함수로 만들면 좋다.
    // 상태에 따른 버튼 변경
    class func changeButton(btn: UIButton, btnLabel: String, btnColor: UIColor){
        btn.setTitle(btnLabel, for: UIControlState.normal)  // 버튼 명
        btn.backgroundColor = btnColor                      // 버튼 색상
    }
    
    class func changeLabel(label: UILabel, msg: String){
        label.text = msg
    }
    
    /*
    // 알럿 노출 함수 - 알럿과 같이 UI 관련 모듈은 view controller에 쓴다.
    func presentAlert(title: String, msg: String){
        // 알럿 본체 생성
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        // 알럿에 붙일 액션 생성 (확인 액션만 만듦)
        let alertaction = UIAlertAction(title: "확인", style: .default, handler: nil)
        // 알럿 본체에 액션 붙임
        alert.addAction(alertaction)
        presentAlert(title: "중복되는 숫자는 입력할 수 없습니다.", msg: "")
    }
     */
}
