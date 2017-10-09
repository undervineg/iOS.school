//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by 심 승민 on 2017. 9. 27..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var userModel = UserModel()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load: login VC")
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func findUser(name: String, password: String)->Bool{
        // UserDefaults.standard.array의 반환타입이 Any이기 때문에 userList의 타입을 명시하고 다운캐스팅해서 대입
        guard let userList: [[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] else { return false }
        
        for userData in userList{
            let memberID: String = userData["ID"]!
            let memberPW: String = userData["PW"]!
            if memberID == name && memberPW == password {
                return true
            }
        }
        
        return false
    }
    
    @IBAction func didTabLoginButton(_ sender: RoundButton) {
        guard let username = usernameTextField.text, !username.isEmpty else{ return }
        guard let password = passwordTextField.text, !password.isEmpty else{ return }
        
        //let isLoginSuccess: Bool = userModel.doesUserExist(username: username, password: password)
        let isLoginSuccess: Bool = findUser(name: username, password: password)
        
        if isLoginSuccess{
            // 로그인 성공 --> 화면전환(메인)
            let main = MainViewController()
            present(main, animated: true, completion: {
                self.userModel.printAllUsers()
            })
        }else{
            // 로그인 실패 --> 텍스트필드 배경색 변경(빨강)
            //usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            //passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            
            // username과 password 창을 왼쪽으로 10(-10) --> 오른쪽으로 10(+20) --> 제자리(-10)
            UIView.animate(withDuration: 0.1, animations: {
                self.usernameTextField.frame.origin.x -= 10
                self.passwordTextField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.usernameTextField.frame.origin.x += 30
                    self.passwordTextField.frame.origin.x += 30
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.usernameTextField.frame.origin.x -= 20
                        self.passwordTextField.frame.origin.x -= 20
                    })
                })
            })
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 다운캐스팅은 실패할 수 있으므로 as?를 쓰고 옵셔널바인딩을 함
        if let nextVC = segue.destination as? SignUpViewController{
            nextVC.didTaskClosure = {(username: String, password: String) -> Void in
                self.userModel.addUser(name: username, password: password)
            }
            
            nextVC.isDuplicatedUserName = {(username: String) -> Bool in
                for user in self.userModel.model{
                    if user.username == username{
                        return true
                    }
                }
                return false
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    
    override func loadView() {
        super.loadView()
        print("load view: login VC")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("view will appear: login VC")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews: login VC")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subviews: login VC")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("view did appear: login VC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("view will disappear: login VC")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("view did disappear: login VC")
    }
}
