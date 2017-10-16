//
//  ViewController.swift
//  TableViewTest
//
//  Created by 심 승민 on 2017. 10. 10..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 기본적으로 plain을 많이 씀. group은 설정페이지 등에 쓰임
        let tv: UITableView = UITableView(frame: view.bounds, style: .plain)
        tv.dataSource = self
        tv.delegate = self
        // register는 스토리보드가 아닌 클래스를 통해 셀을 만들고 재사용할 때 해줌
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        view.addSubview(tv)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "This is Cell"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // cell의 frame은 tableView가 관장함. 따라서 우리가 cell의 frame을 직접 지정하진 않음
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 인스턴스는 생성하나, 스토리보드와 관계없이 생성됨
        //let secondVC = SecondViewController()
        
        // 해당 스토리보드 상의 특정 ID를 가지는 VC를 가져옴
        // 현재 VC도 ID 값을 주면 다음과같이 인스턴스 생성 가능 (나중에 맨 첫화면을 다시 부르고 싶으면)
        // 이렇게 가져온 VC의 타입은 UIViewController이기 때문에 다운캐스팅
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let storyboard = UIStoryboard(name: "Sub", bundle: nil)
        // 현 VC가 스토리보드에서 생성된 애라면, self를 써도 됨. 같은 스토리보드 상에 있는 VC를 가져와라~
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            // 가져온 VC로 화면 전환
            present(secondVC, animated: true, completion: nil)
        }
        
    }

}








