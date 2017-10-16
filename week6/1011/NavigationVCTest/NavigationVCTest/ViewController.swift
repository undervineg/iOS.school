//
//  ViewController.swift
//  NavigationVCTest
//
//  Created by 심 승민 on 2017. 10. 11..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

// Navigation VC의 root VC
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change button color in all VCs of navigationBar
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let nextBtn = UIButton(type: .system)
        nextBtn.setTitle("다음", for: .normal)
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)), for: .touchUpInside)
        // view.addSubview를 하는 게 아니라, navigationItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        
        self.navigationItem.title = "라쥐타이틀"
        
        let back = UILabel(frame: CGRect(x: 100, y: 1000, width: view.frame.width, height: 40))
        back.text = "<<<"
        back.backgroundColor = .red
        let backTitleBtn = UIButton()
        backTitleBtn.setTitle("뒤로", for: .normal)
        backTitleBtn.addTarget(self, action: #selector(backBtnHandle(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: back), UIBarButtonItem(customView: backTitleBtn)]
    }
    
    @objc func backBtnHandle(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtnHandler(_ sender: UIButton){
        goNextVC()
    }
    
    private func goNextVC(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC: SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
/*
    func pushAction(){
        let nextVC = UIViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func popAction(){
        self.navigationController?.popViewController(animated: true)
    }
*/
}

