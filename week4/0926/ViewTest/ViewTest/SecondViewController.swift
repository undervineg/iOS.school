//
//  SecondViewController.swift
//  ViewTest
//
//  Created by 심 승민 on 2017. 9. 26..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<3{
            for j in 0..<3{
                let posX = CGFloat(i)*view.frame.width/3
                let posY = CGFloat(j)*view.frame.width/3
                let button = UIButton(type: .system)
                button.frame = CGRect(x: posX, y: posY, width: view.frame.width/3, height: view.frame.width/3)
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.black.cgColor
                button.setTitle("Button\(i+1)", for: .normal)
                button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Thin", size: 20)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                button.isSelected = false
                button.setTitleColor(UIColor.white, for: .selected)
                button.addTarget(self, action: #selector(buttonAction(_:)), for: UIControlEvents.touchUpInside)
                view.addSubview(button)
            }
        }
    }
    
    @objc func buttonAction(_ sender: UIButton){
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
