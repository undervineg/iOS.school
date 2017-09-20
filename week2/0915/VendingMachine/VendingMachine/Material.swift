//
//  Material.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Material{
    private let name: String
    private let useUnits: Dictionary<String, Int>
    private var stock: Int = 0
    
    
    init(name: String, useUnits: [String:Int]){
        self.name = name
        self.useUnits = useUnits
    }
    
    func getName()->String{
        return self.name
    }
    
    func getUseUnits()->[String:Int]{
        return self.useUnits
    }
    
    func getUseUnitAmount(unit: String)->Int{
        if let unit = useUnits[unit]{
            return unit
        }else{
            return 0
        }
    }
    
    func getStock()->Int{
        return self.stock
    }
    
    func setStock(of amount: Int){
        self.stock = amount
    }
    
    func use(sizeOf: String) {
        self.stock -= self.getUseUnitAmount(unit: sizeOf)
    }
}
