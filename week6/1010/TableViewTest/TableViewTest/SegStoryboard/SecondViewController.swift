//
//  SecondViewController.swift
//  TableViewTest
//
//  Created by 심 승민 on 2017. 10. 10..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lb: UILabel!
    var sendedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeBtn = UIButton(type: .system)
        closeBtn.frame = CGRect(x: view.frame.width-50, y: 0, width: 50, height: 50)
        closeBtn.setTitle("닫기", for: .normal)
        closeBtn.setTitleColor(.white, for: .normal)
        closeBtn.addTarget(self, action: #selector(self.close(_:)), for: .touchUpInside)
        //view.addSubview(closeBtn)
        
        
        lb.text = sendedText
        //lb.text = self.sendedText
        
    }
    
    @objc func close(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendMessage(msg: String?){
        print("sendMessage:", msg!)
        sendedText = msg
        
        // 현재 VC를 부른 놈이 누구인지 판별할 때 쓸 수 있음
        // 이전 뷰컨트롤러
        //let beforeVC = presentingViewController
        // 다음 뷰컨트롤러
        //let nextVC = self.presentedViewController
    }


}
