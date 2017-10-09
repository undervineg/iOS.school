//
//  ThirdViewController.swift
//  ViewTest
//
//  Created by 심 승민 on 2017. 9. 26..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var buttons: [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = []
        
        for i in 0..<3{
            for j in 0..<3{
                let posX = CGFloat(i)*view.frame.width/3
                let posY = CGFloat(j)*view.frame.width/3
                let button = UIButton(type: .custom)
                button.frame = CGRect(x: posX, y: posY, width: view.frame.width/3, height: view.frame.width/3)
                button.layer.cornerRadius = 20
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.black.cgColor
                button.setTitle("Button\((i+1)+3*j)", for: .normal)
                button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Thin", size: 20)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                button.setTitleColor(UIColor.gray, for: .normal)
                button.setTitleColor(UIColor.orange, for: .selected)
                button.addTarget(self, action: #selector(buttonAction(_:)), for: UIControlEvents.touchUpInside)
                button.tag = (i+1)+3*j
                view.addSubview(button)
                buttons!.append(button)
            }
        }

    }
    
    @objc func buttonAction(_ sender: UIButton){
        if !sender.isSelected{
            // 누른 버튼을 on
            sender.isSelected = true
            for button in buttons!{
                if sender.tag % 2 == 0{
                    // 누른 버튼이 짝수번째 버튼이면
                    if button.tag % 2 == 0{
                        // 모든 짝수번째 버튼들을 함께 on
                        button.isSelected = true
                    }else{
                        // 모든 홀수번째 버튼들은 눌려져있다면 off
                        button.isSelected = false
                    }
                }
                else if sender.tag % 2 != 0{
                    // 누른 버튼이 홀수번째 버튼이면
                    if button.tag % 2 != 0{
                        // 모든 홀수번째 버튼들을 함께 on
                        button.isSelected = true
                    }else{
                        // 모든 짝수번째 버튼들은 눌려져있다면 off
                        button.isSelected = false
                    }
                }
            }
        }
        else{
            // 누른 버튼을 off
            //sender.isSelected = false
            for button in buttons!{
                // 모든 버튼들을 off (짝수 누르면 홀수는 자동으로 off 되므로, 사실상 현재 눌린 버튼들만 off 됨)
                button.isSelected = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
