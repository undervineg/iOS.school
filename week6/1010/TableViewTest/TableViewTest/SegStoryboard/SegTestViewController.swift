//
//  SegTestViewController.swift
//  TableViewTest
//
//  Created by 심 승민 on 2017. 10. 10..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class SegTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tf: UITextField!
    var isAbleToNext: Bool = true
    
    @IBAction func ableToNextSwitch(_ sender: UISwitch) {
        isAbleToNext = sender.isOn
    }
    
    // override 메소드. 즉, 이미 메소드는 실행되고 있었다는 뜻
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 세그 구분
        if identifier == "nextSecondVCSegue"{
            // 스위치가 on이면 세그 실행
            return isAbleToNext
        }else{
            // 스위치가 off이면 세그 실행 안 함
            return false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepareForSegue")
        let sendStr = tf.text ?? "noText"
        if let destVC = segue.destination as? SecondViewController{
            destVC.sendMessage(msg: sendStr)
            //destVC.sendedText = sendStr
        }
    }
    
    // unwind 시, 세그를 받는 IBAction이 필요함
    @IBAction func unwindAction(_ sender: UIStoryboardSegue){
        
    }

}
