//
//  SignUpViewController.swift
//  LoginScreen
//
//  Created by 심 승민 on 2017. 9. 27..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var didTaskClosure: ((String, String)->(Void))?
    var isDuplicatedUserName: ((String)->Bool)?
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord1: UITextField!
    @IBOutlet weak var passWord2: UITextField!
    @IBOutlet weak var signUpButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("view did load: login VC")
        
        userName.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        passWord1.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        passWord2.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
    }
    
    @objc func didEndOnExit(_ sender: UITextField){
        switch sender {     // if 문 쓸 때는 === 사용
        case userName:
            passWord1.becomeFirstResponder()
        case passWord1:
            passWord2.becomeFirstResponder()
        case passWord2:
            signUpButton.becomeFirstResponder()
        default:
            break
        }
    }
    
    
    
    @IBAction func ddTabSignUpButton(_ sender: RoundButton) {
        if userName.text! == "" || passWord1.text! == "" || passWord2.text! == ""{
            presentAlert(myMessage: "세 칸을 모두 입력해주세요.")
            return
        }
        
        if isDuplicatedUserName!(userName.text!){
            presentAlert(myMessage: "중복된 ID 입니다.")
            return
        }
        
        if passWord1.text! == passWord2.text!{
            //didTaskClosure!(userName.text!, passWord1.text!)
            
            // 여러개를 추가하기 위해서는 기존 UserDefaults 리스트를 받아와서
            // 있으면 기존 걸 받아와서 추가하고, 없으면 생성
            var list: [[String:String]]
            if let tmpList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]]{
                list = tmpList
            }else{
                list = []
            }
            
            let userData:[String:String] = ["ID":userName.text!, "PW":passWord1.text!]
            list.append(userData)
            
            UserDefaults.standard.set(list, forKey: "UserList")
            
        }else{
            presentAlert(myMessage: "패스워드를 다시 확인해주세요.")
        }
        
    }
    
    func presentAlert(myMessage: String){
        let alertController = UIAlertController(title: myMessage, message: "", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "확인", style: .default) { (action) in
            print("확인 버튼이 클릭되었습니다.")
        }
        
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

    @IBAction func didTabBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        print("load view: sign up VC")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("view will appear: sign up VC")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews: sign up VC")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subviews: sign up VC")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("view did appear: sign up VC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("view will disappear: sign up VC")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("view did disappear: sign up VC")
    }
}
