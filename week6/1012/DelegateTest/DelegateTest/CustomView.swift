//
//  CustomView.swift
//  DelegateTest
//
//  Created by 심 승민 on 2017. 10. 12..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var titleLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func changeText(text: String){
        titleLb.text = text
    }

}
