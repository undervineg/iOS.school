//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by 심 승민 on 2017. 9. 28..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollExam3()
        print("offset: ", scrollView.contentOffset.x)
        print("contentSize: ", scrollView.contentSize.width)
        print("frameSize: ", scrollView.frame.size.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentOffset은 ScrollView와 ContentView 사이의 차이를 의미
        let offsetX: CGFloat = scrollView.contentOffset.x
        let colorValue = 1 - (offsetX / (scrollView.contentSize.width - scrollView.frame.size.width))/255
        print("offset: ", scrollView.contentOffset.x)
        print("colorValue: ", colorValue)
        scrollView.backgroundColor = UIColor(red: colorValue, green: 0, blue: 0, alpha: 1)
    }
    
    
    func scrollExam1(){
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400))
        
        // 스크롤뷰에 10개의 사각형 뷰를 붙임
        for n in 0..<10{
            let row = CGFloat(n/10)
            let col = CGFloat(n%10)
            let n = CGFloat(n)
            let view: UIView = UIView(frame: CGRect(x: row*100, y: col*100, width: 100, height: 100))
            view.backgroundColor = UIColor(red: n*25/255.0, green: n*25/255.0, blue: n*25/255.0, alpha: 1)
            scrollView.addSubview(view)
        }
        // 콘텐츠사이즈가 있어야 스크롤이 됨
        scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.size.height)
        // 바운스 되는 현상을 off
        scrollView.bounces = false
        // 페이지 단위로 넘김 (단위 = scrollview의 사이즈)
        // 이동거리의 50% 넘어가면 넘어감.
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
    }

    func scrollExam2(){
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        var imageView: [UIView] = []
        for i in 0..<3{
            imageView.append(UIView(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)))
        }
        
        imageView[0].backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        imageView[1].backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        imageView[2].backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        scrollView.addSubview(imageView[0])
        scrollView.addSubview(imageView[1])
        scrollView.addSubview(imageView[2])
        
        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
        
        let switcher: UISwitch = UISwitch(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        scrollView.addSubview(switcher)
        switcher.addTarget(self, action: #selector(valueChangeSwitcher(_:)), for: .valueChanged)
        view.addSubview(scrollView)
    }
    
    func scrollExam3(){
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        scrollView.delegate = self
        
        for n in 0..<30{
            let n = CGFloat(n)
            let view: UIView = UIView(frame: CGRect(x: n*100, y: 0, width: 100, height: 100))
            //view.backgroundColor = UIColor(red: n*25/255.0, green: n*25/255.0, blue: n*25/255.0, alpha: 1)
            scrollView.addSubview(view)
        }
        scrollView.contentSize = CGSize(width: 3000, height: 200)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
    }
    
    func valueChangeSwitcher(_ sender: UISwitch){
        if sender.isOn{
            print("스위치 온")
        }else{
            print("스위치 오프")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

