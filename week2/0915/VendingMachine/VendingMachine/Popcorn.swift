//
//  Popcorn.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Popcorn : Material{
    static let sizeMenus: [String] = ["중","대"]
    private let name: String = "팝콘"
    private let midUnit: Int = 50
    private let largeUnit: Int = 100
    private var size: String = ""
    
    
    
    func setSize(ofPopcorn size: String){
        self.size = size
    }
    
    func getSize()->String{
        return self.size
    }
    
    override func use() {
        if self.size == "중"{
            self.setStock(of: self.getStock() - self.midUnit)
        }else if self.size == "대"{
            self.setStock(of: self.getStock() - self.largeUnit)
        }
    }
}
