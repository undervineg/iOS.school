//
//  Pokemon.swift
//  MyCalculator
//
//  Created by esung on 2017. 9. 12..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation

class Pokemon{
    var nickName:String = ""
    var monsterID:Int = 0
    var hp = 10
    var attack = 10
    var defense = 10
    var speed = 10
    var special = 10
    
    var skillNames = [String]()
    var imageSource = ""
   
    init(nickName:String) {
        self.nickName = nickName
    }
    
    init(){}
}

class Charmander : Pokemon{
    override init() {
        super.init()
        self.monsterID = 4
        self.skillNames = ["Growl","Scratch","Ember"]
    }
    
    override init(nickName: String) {
        super.init()
    }
}

class Charmeleon : Pokemon{
    override init() {
        super.init()
        self.monsterID = 5
        self.attack = self.attack*2
        self.defense = self.defense*2
        self.hp = self.hp*2
    }
    
    override init(nickName: String) {
        super.init()
    }
}

class Charizahrd : Pokemon {
     override init() {
        super.init()
        self.monsterID = 6
        self.attack = self.attack*3
        self.defense = self.defense*3
        self.hp = self.hp*3
    }
    
    override init(nickName: String) {
        super.init()
    }   
}