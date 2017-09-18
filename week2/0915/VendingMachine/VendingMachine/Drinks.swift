//
//  Drinks.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Drinks : Material{
    //static let drinkMenus: [String] = ["콜라"]
    private let name: String = "콜라"
    private let useUnit: Double = 0.5
    private var stock: Double = 0.0
    
    
    func setStock(of amount: Double) {
        self.stock = amount
    }
    
    func getStock() -> Double {
        return self.stock
    }
    
    override func use() {
        self.stock -= useUnit
    }
}
