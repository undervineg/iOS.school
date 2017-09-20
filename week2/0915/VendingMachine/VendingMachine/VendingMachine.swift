//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 18..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class VendingMachine{
    private var menuList: [Menu]
    
    init(){
        self.menuList = []
    }
    
    init(menuList: [Menu]) {
        self.menuList = menuList
    }
    
    func getMenuList()->[Menu]{
        return self.menuList
    }
    
    func addMenu(menu: Menu){
        menuList.append(menu)
    }
}
