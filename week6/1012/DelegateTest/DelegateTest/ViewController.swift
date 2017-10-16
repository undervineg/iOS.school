//
//  ViewController.swift
//  DelegateTest
//
//  Created by 심 승민 on 2017. 10. 12..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newView.changeText(text: "하이")
    }


}

