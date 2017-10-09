//
//  Customer.swift
//  Cafe
//
//  Created by 심 승민 on 2017. 10. 6..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Custormer{
    private var name: String
    private var amount: Int
    private var beverage: Beverage?
    
    init(name: String, amount: Int){
        self.name = name
        self.amount = amount
    }
    
}
