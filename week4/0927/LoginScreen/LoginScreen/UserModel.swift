//
//  UserModel.swift
//  LoginScreen
//
//  Created by 심 승민 on 2017. 9. 27..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

final class UserModel{  // 어디서도 상속할 수 없는 클래스. 컴파일이 좀 더 빨라진다고 함
    
    var model: [User] = []
    
    struct User{
        var username: String
        var password: String
    }
    
    // 로그인 시 아이디와 패스워드 확인하는 함수
    func doesUserExist(username: String, password: String)->Bool{
        for user in model{
            if username == user.username && password == user.password{
                return true
            }
        }
        return false
    }
    
    func addUser(name: String, password: String){
        let newUser = User(username: name, password: password)
        model.append(newUser)
    }
    
    func printAllUsers(){
        print(model)
    }
}
