//
//  Account.swift
//  Bank
//
//  Created by 심 승민 on 2017. 9. 14..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Account{
    let bankName: String
    var balance: Int
    
    init(bankName: String, balance: Int){
        self.bankName = bankName
        self.balance = balance
    }
}
