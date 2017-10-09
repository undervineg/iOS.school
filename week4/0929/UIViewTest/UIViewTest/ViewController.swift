//
//  ViewController.swift
//  UIViewTest
//
//  Created by 심 승민 on 2017. 9. 29..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createView()
        updateLayout()
    }

    weak var subView: UIView?   // weak는 빌려쓴다는 의미
    weak var lb: UILabel?
    weak var btn: UIButton?
    weak var sv: UIScrollView?
    
    func createView(){
        // createView() 안의 subView는 함수가 끝나면 사라짐. VC의 전역변수인 subView에 저장
        self.subView = createdSubView
        // 뷰 추가만 함 (생성은 클로저에서)
        self.view.addSubview(self.subView!)
        
        let sv: UIScrollView = UIScrollView()
        // self는 프로토콜을 채택한 인스턴스이다.
        sv.delegate = self
        self.sv = sv
        self.view.addSubview(self.sv!)
        
        self.lb = createdLabel
        self.sv!.addSubview(self.lb!)
        
        self.btn = createdButton
        self.sv!.addSubview(self.btn!)
        
        makeTableView()
    }
    
    func makeTableView(){
        // 80% 정도가 plain을 씀
        // 테이블 뷰만 크기 지정해서 올려놓으면, delegate나 data source를 사용해서 몇 가지 정보만 주면
        // 테이블뷰가 알아서 만듦 (VC -> TableView)
        // 테이블뷰는 scrollView를 상속받는데, contentView 크기는 지정해주지 않아도 됨. 알아서 계산함
        let tableView: UITableView = UITableView(frame: CGRect(x:0, y:0, width:view.frame.size.width, height: view.frame.size.height), style: .plain)
        // Data Source를 사용하려면 이렇게 써야 함
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // TableView Delegate의 함수임. heightForRowAt은 한 줄당 높이임
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // section 당 row의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // row당 UI가 무엇인지~
    // 화면에 새로운 cell이 보일 때마다 호출되기 때문에 스크롤을 올리고 내릴때마다 호출됨
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()    // 이렇게 하면 이 함수가 호출될 때마다 인스턴스를 생성하기 때문에, 재사용 방식을 사용해야 함
        return cell
 
        // 재사용 방식: UI는 보여지는 부분에서만 사용하고, 데이터만 계속 호출해서 노출함
        // 즉, UI는 아래로 내리면 위에 안 보이는 부분은 아래로 다시 내려서 재사용하는 식.
    }
    
    // 버튼은 생성시에 type을 지정해야함. 그리고 state에 따라 속성을 변경해줄 수 있음(set~ 함수들)
    let createdButton: UIButton = {
        // 1. 타입설정은 초기화 수준에서만 가능
        let btn: UIButton = UIButton(type: .system)
        // 2. 상태선택(normal, highlighted, selected 등)
        btn.setTitle("버튼이름", for: .normal)
        btn.setTitle("hightlighted", for: .highlighted)
        // 3. addTarget
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return btn
    }()
    
    func btnAction(_ sender: UIButton){
        print("버튼이 눌렸습니다.")
    }
    
    let createdLabel: UILabel = {
        // lb는 보통 backgroundColor를 만들지 않음. 하지만 위치를 확인하기 위해 컬러값을 넣었다가
        // 런칭 전에 clear로 바꿈
        let lb: UILabel = UILabel()
        // 이건 swift3 문법임..
        lb.attributedText = NSAttributedString(string: "안녕친구야", attributes: [NSUnderlineStyleAttributeName:NSUnderlineStyle.styleDouble.rawValue])
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.tag = 100
        return lb
    }()
    
    // 클로저를 사용한 UIView 인스턴스 생성
    let createdSubView: UIView = {
        // 뷰
        let subView: UIView = UIView()
        // 속성
        subView.backgroundColor = UIColor(red: 122/255, green: 0.5, blue: 0.5, alpha: 1)
        subView.alpha = 1
        subView.tag = 10
        return subView
    }()
    
    // createView에서 뷰를 다 만든 후 레이아웃만 처리
    func updateLayout(){
        // 반복될 만한 값은 변수에 저장해서 쓰는 게 좋음
        let screenSizeWidth: CGFloat = self.view.frame.width
        let screenSizeHeight: CGFloat = self.view.frame.height
        let viewWidth: Int = 200
        
        // 메인 frame 크기를 지정함
        self.view.frame = CGRect(x: 0, y: 0, width: screenSizeWidth, height: screenSizeHeight)
        // UIView인 suvView의 크기를 지정함
        self.subView!.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // 스크롤뷰의 화면 사이즈와 콘텐츠 사이즈 설정
        self.sv!.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth)
        self.sv!.contentSize = CGSize(width: sv!.frame.size.width * 10, height: sv!.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

