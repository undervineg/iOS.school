//
//  RoundButton.swift
//  LoginScreen
//
//  Created by 심 승민 on 2017. 9. 27..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

@IBDesignable   // 인터페이스 빌더에서 수정 가능한 class
class RoundButton: UIButton {

    // 추적가능한 변수
    @IBInspectable var radius: CGFloat = 0{
        // 스토리보드에서 RoundButton class에 연결하면
        // 스토리보드상에서 속성값을 줄 수 있음.
        // 속성값을 변경하면 여기에서 반영을 해야 하기 때문에 Observer를 사용
        didSet{
            self.layer.cornerRadius = radius
        }
    }
}
