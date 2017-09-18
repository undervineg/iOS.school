//
//  Customer.swift
//  Bank
//
//  Created by 심 승민 on 2017. 9. 14..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Customer{
    let name: String
    var address: String
    var accounts: [Account] = []
    
    
    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    
    func sumProperties()->Int{
        var totalBalance: Int = 0
        for acc in accounts{
            totalBalance += acc.balance
        }
        return totalBalance
    }
}
