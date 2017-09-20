//
//  Menu.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Menu{
    private let name: String
    private var materials: [(Material, Int, Int)]  // 재료 이름과 메뉴에 들어가는 재료 useUnit 및 수량
    
    init(name: String, mat: [(Material, Int, Int)]){
        self.name = name
        self.materials = mat
    }
    
    func getMenuName()->String{
        return self.name
    }
    
    func getMaterialsInMenu()->[(Material, Int, Int)]{
        return self.materials
    }
    
    func setMaterial(mat: Material, useUnit: Int, amount: Int){
        self.materials.append(mat, useUnit, amount)
    }
    
    // 메뉴에 들어가는 모든 재료들의 재고를 확인하여 재고가 하나라도 누락된 경우 false 리턴
    func checkStocks() -> Bool {
        var hasStocks: Bool = true
        for mat in materials{
            if mat.0.getStock() < mat.1 * mat.2{
                hasStocks = false
            }
        }
        return hasStocks
    }
}
