//
//  Menu.swift
//  Cafe
//
//  Created by 심 승민 on 2017. 10. 6..
//  Copyright © 2017년 심 승민. All rights reserved.
//

enum Menu: String{
    case americano
    case cafeLatte
    case caramelMachiatto
}

let menus: Dictionary<String, Int> = [
    Menu.americano.rawValue : 4100,
    Menu.cafeLatte.rawValue : 4500,
    Menu.caramelMachiatto.rawValue : 5000
]
