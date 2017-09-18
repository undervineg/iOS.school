//
//  Material.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Material{
    private let name: String = ""
    private var useUnit: Int = 0
    private var stock: Int = 0
    
    
    init(stock: Int){
        self.stock = stock
    }
    
    init(useUnit: Int, stock: Int){
        self.useUnit = useUnit
        self.stock = stock
    }
    
    func getName()->String{
        return self.name
    }
    
    func getStock()->Int{
        return self.stock
    }
    
    func setStock(of amount: Int){
        self.stock = amount
    }
    
    func use() {
        self.stock -= self.useUnit
    }
}
