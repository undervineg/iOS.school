//
//  Barista.swift
//  Cafe
//
//  Created by 심 승민 on 2017. 10. 6..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Barista{
    private let name: String
    private var grade: Int
    
    init(name: String, grade: Int){
        self.name = name
        self.grade = grade
    }
    
    // 일정금액을 "받고", 음료객체를 "반환"
    func order(menu: Menu, change: Int) -> Beverage{
        if menus[menu.rawValue]! > change{
            print("돈이 모자랍니다.")
            return Beverage(name: "")
        }else{
            return Beverage(name: menu.rawValue)
        }
    }
    
}
