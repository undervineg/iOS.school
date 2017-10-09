//
//  M.swift
//  AlarmApp
//
//  Created by 심 승민 on 2017. 10. 5..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

// struct 인스턴스는 stack에 쌓임. 따라서 class보다 빠름. class는 실행될 때 메모리 영역이 정해지기 때문임
// 대부분 Model은 struct로 만듦. 또, Networking할 때도 struct로 만듦
struct Model {
    var time: Int
    var text: String
    var subText: String?
    var isActivated: Bool
}
