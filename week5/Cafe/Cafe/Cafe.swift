//
//  Cafe.swift
//  Cafe
//
//  Created by 심 승민 on 2017. 10. 6..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Cafe{
    private let name: String
    private var baristas: [Barista]?
    private var sales: Int = 0
    
    init(name: String){
        self.name = name
    }
    
    func employBarista(barista: Barista){
        baristas?.append(barista)
    }
    
    func addSales(sales: Int){
        self.sales = sales
    }
}
