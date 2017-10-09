//
//  ViewController.swift
//  ViewTest
//
//  Created by 심 승민 on 2017. 9. 26..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var onBtn: UIButton!
    var offBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBtn = UIButton(type: .system)
        onBtn.frame = CGRect(x: 0, y: 300, width: 200, height: 100)
        onBtn.setTitle(".normal", for: .normal)
        onBtn.setTitleColor(UIColor.white, for: .normal)
        onBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        onBtn.setTitleColor(UIColor.cyan, for: .highlighted)
        onBtn.setTitle(".selected", for: .selected)
        onBtn.backgroundColor = .black
        onBtn.isSelected = false
        onBtn.isUserInteractionEnabled = true
        onBtn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
        view.addSubview(onBtn)
        
        offBtn = UIButton(type: .system)
        offBtn.frame = CGRect(x: 200, y: 300, width: 200, height: 100)
        offBtn.setTitle(".normal", for: .normal)
        offBtn.setTitleColor(UIColor.white, for: .normal)
        offBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        offBtn.setTitleColor(UIColor.cyan, for: .highlighted)
        offBtn.setTitle(".selected", for: .selected)
        offBtn.backgroundColor = .black
        offBtn.isSelected = true
        offBtn.isUserInteractionEnabled = false
        offBtn.addTarget(self, action: #selector(offBtnAction(_:)), for: .touchUpInside)
        view.addSubview(offBtn)
    }
    
    @objc func onBtnAction(_ sender: UIButton){
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        offBtn.isSelected = false
        offBtn.isUserInteractionEnabled = true
    }

    @objc func offBtnAction(_ sender: UIButton){
        sender.isSelected = false
        sender.isUserInteractionEnabled = true
        onBtn.isSelected = true
        onBtn.isUserInteractionEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

