//
//  main.swift
//  Bank
//
//  Created by 심 승민 on 2017. 9. 14..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

let account1: Account = Account.init(bankName: "우리은행", balance: 3000)
let account2: Account = Account.init(bankName: "카카오뱅크", balance: 5000)
let customer1: Customer = Customer.init(name: "라이언", address: "강남")

customer1.accounts = [account1, account2]
print(customer1.sumProperties())
