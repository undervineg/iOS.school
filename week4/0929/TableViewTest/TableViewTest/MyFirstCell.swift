//
//  MyFirstCell.swift
//  TableViewTest
//
//  Created by 심 승민 on 2017. 9. 29..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class MyFirstCell: UITableViewCell {

    var bgImgView: UIImageView?
    
    // VC에서 dequeueResuableCell() 호출 시 실행됨
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func createView(){
        bgImgView = UIImageView()
        self.addSubview(bgImgView!)
    }
    
    func setImageName(name: String){
        bgImgView!.image = UIImage(named: name)
    }
    
    
    // 이 셀의 모든 레이아웃 중 하나라도 바뀌면 호출되는 함수임 
    // --> 엄청 많이 호출되기 때문에 인스턴스 생성하거나 데이터 관련되는 로직은 넣지 않는다!
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    // 셀의 프레임이 생성돼 있어야 함 -> VC의 셀 크기 만드는 함수가 실행되기 전에 불리기 때문에 나타나지 않음
    // 해결방법 --> layoutSubviews()에서 호출
    func updateLayout(){
        bgImgView!.frame = self.bounds
    }
}
