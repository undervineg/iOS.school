//
//  ViewController.swift
//  DelegatePractice
//
//  Created by 심 승민 on 2017. 10. 12..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    @IBOutlet weak var myCustomView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myCustomView.delegate = self
    }


    func testFunction(_ customView: CustomView) {
        myCustomView.button.setTitleColor(UIColor.red, for: .normal)
        let image: UIImage? = UIImage(named: "ico-logo@3x.png")
        myCustomView.imageView.image = image
    }
}

