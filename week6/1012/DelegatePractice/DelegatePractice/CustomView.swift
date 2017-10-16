//
//  CustomView.swift
//  DelegatePractice
//
//  Created by 심 승민 on 2017. 10. 12..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var delegate: CustomViewDelegate?
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch){
        if sender.isOn{
            delegate?.testFunction(self)
        }
    }
    
}

protocol CustomViewDelegate{
    func testFunction(_ customeView: CustomView)
}
