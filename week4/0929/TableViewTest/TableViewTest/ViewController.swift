//
//  ViewController.swift
//  TableViewTest
//
//  Created by 심 승민 on 2017. 9. 29..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pocketmon: [String] = ["1","2","3","4","5","6","7","8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tv: UITableView = UITableView(frame: view.bounds, style: .plain)
        // 대부분 dataSource와 delegate를 기본적으로 설정하는 편이다.
        tv.dataSource = self
        tv.delegate = self
        
        // 셀을 등록. .self는 클래스 자체를 가리킴.
        // 셀UI를 구성하는 커스텀 클래스를 만들고 해당 클래스를 던져주면 tv가 알아서 인스턴스를 만들어 테이블뷰에 붙이게 되는 것
        tv.register(MyFirstCell.self, forCellReuseIdentifier: "MyFirstCell")
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tv)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 총 row의 개수는 100개인데, 처음 보이는 화면에는 17개만 뜬다면 그건 새로 만든 것이고, 
        // 화면을 내리면서 셀이 계속 재사용되는 것
        return pocketmon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell create start")
        // dequeue = 큐 자료구조에서 데이터를 끄집어내는 것
        // Identifier에 해당하는 셀이 큐에 있으면 끄집어오고, 없으면 등록돼 있는 것을 토대로 새로 만듦
        // 등록한 셀은 MyFirstCell인데, dequeue함수의 리턴값은 UITableCell이므로, 다운캐스팅 해야 함
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = pocketmon[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath) as! MyFirstCell
            // 셀에 데이터를 넣어줌
            cell.setImageName(name: pocketmon[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // row의 높이
        if indexPath.section == 0{
            return 50
        }else{
            return 300
        }
    }
    
    // 셀을 선택했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "현재 귀하는 \(pocketmon[indexPath.row]) 을/를\n선택하셨습니다.", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*
         테이블뷰에서 데이터를 무제한으로 보여주고 싶다면..
        if 컨텐츠뷰의 offset이 1000이하면{
            데이터 추가요청
            데이터 리로드
        }
        */
    }
    
}

