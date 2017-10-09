//
//  Beverage.swift
//  Cafe
//
//  Created by 심 승민 on 2017. 10. 6..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Beverage{
    private let name: String
    private let price: Int
    
    init(name: String){
        self.name = name
        self.price = menus[name]!
    }
}
