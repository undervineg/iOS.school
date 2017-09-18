//
//  Pocketmon.swift
//  Pocketmon
//
//  Created by 심 승민 on 2017. 9. 12..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Pocketmon{
    var name: String?
    var attackType: String?
    var color: String?
    var level: Int = 1
    var size: Int?
    
    
    init(name: String, attackType: String, color: String){
        self.name = name
        self.attackType = attackType
        self.color = color
    }
    
    func attack(){
        
    }
    
    func defend(){
        
    }
    
    func cry(){
        
    }
    
    func evolve(levelTo: Int) {
        
    }
    
}
