//
//  FourthViewController.swift
//  ViewTest
//
//  Created by 심 승민 on 2017. 9. 26..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITextFieldDelegate {

    var buttons: [UIButton]?
    var tf: UITextField?
    var checkBtn: UIButton?
    var lb: UILabel?
    var lbString: String?
    var lbStringAll: NSMutableAttributedString?
    var attributedString: NSMutableAttributedString?
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = []
        for i in 0..<3{
            for j in 0..<3{
                let posX = CGFloat(i)*view.frame.width/3
                let posY = CGFloat(j)*view.frame.width/3
                let button = UIButton(type: .system)
                button.frame = CGRect(x: posX, y: posY, width: view.frame.width/3, height: view.frame.width/3)
                button.layer.cornerRadius = 20
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.black.cgColor
                button.setTitle("Button\((i+1)+3*j)", for: .normal)
                button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Thin", size: 20)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                button.setTitleColor(UIColor.blue, for: .normal)
                button.setTitleColor(UIColor.white, for: .selected)
                button.addTarget(self, action: #selector(numberButtonAction(_:)), for: UIControlEvents.touchUpInside)
                button.tag = (i+1)+3*j
                view.addSubview(button)
                buttons!.append(button)
            }
        }
        
        tf = UITextField(frame: CGRect(x: 5, y: view.frame.width+10, width: view.frame.width-80, height: 40))
        tf!.backgroundColor = UIColor.white
        tf!.borderStyle = .line
        tf!.borderRect(forBounds: CGRect(x: 3, y: view.frame.width+10, width: view.frame.width-40, height: 200))
        tf!.layer.cornerRadius = 5
        tf!.delegate = self
        tf!.placeholder = " 여기에 작성하세요."
        view.addSubview(tf!)
        
        checkBtn = UIButton(type: .system)
        checkBtn!.frame = CGRect(x: view.frame.width-67, y: view.frame.width+10, width: 60, height: 40)
        checkBtn!.layer.borderWidth = 1
        checkBtn!.layer.borderColor = UIColor.black.cgColor
        checkBtn!.layer.cornerRadius = 5
        checkBtn!.backgroundColor = UIColor.clear
        checkBtn!.setTitle("입력", for: .normal)
        checkBtn!.titleLabel?.font = UIFont.systemFont(ofSize: 20.5, weight: UIFontWeightBold)
        checkBtn!.setTitleColor(UIColor.blue, for: .normal)
        checkBtn!.setTitleColor(UIColor.darkGray, for: .highlighted)
        checkBtn!.addTarget(self, action: #selector(insertButtonAction(_:)), for: .touchUpInside)
        view.addSubview(checkBtn!)
        
        // 라벨은 scrollview 안에 넣을 것이기 때문에 (x,y) 위치는 (0,0)
        lb = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-(view.frame.width+50)))
        lb!.numberOfLines = 0
        lb!.backgroundColor = UIColor.blue
        lb!.textColor = UIColor.white
        lb!.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        
        lbString = String()
        lbStringAll = NSMutableAttributedString()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: view.frame.width+60, width: view.frame.width, height: view.frame.height-(view.frame.width+50)))
        scrollView?.isScrollEnabled = true
        scrollView!.contentSize = CGSize(width: view.frame.width, height: view.frame.height-(view.frame.width+50))
        scrollView!.addSubview(lb!)
        view.addSubview(scrollView!)
    }
    
    @objc func insertButtonAction(_ sender: UIButton){
        for button in buttons!{
            if button.isSelected{
                lbString! = "버튼 \(button.tag)이 선택되었습니다. \n"
                attributedString = NSMutableAttributedString(string: lbString!)
                attributedString!.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30)], range: NSRange(location: 3, length: 1))
                lbStringAll!.append(attributedString!)
                lb!.attributedText =  lbStringAll
            }
        }
    }
    
    @objc func numberButtonAction(_ sender: UIButton){
        if !sender.isSelected{
            tf!.text! = "버튼 \(sender.tag)이 선택되었습니다."
            sender.isSelected = true
            sender.backgroundColor = UIColor.blue
            for button in buttons!{
                if button.tag != sender.tag{
                    button.backgroundColor = UIColor.clear
                    button.isSelected = false
                }
            }
        }else{
            tf!.text! = ""
            sender.backgroundColor = UIColor.clear
            sender.isSelected = false
        }
    }
    
    // UITextFieldDelegate 내부 API
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        // 키보드 내리기. FirstResponder를 resign하면 된다.
        tf!.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
