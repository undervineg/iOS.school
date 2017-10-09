//
//  C.swift
//  AlarmApp
//
//  Created by 심 승민 on 2017. 10. 5..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

class Controller{

    var datas: [Model] = []
    var views: [View] = []
    
    func updateView(){
        // UI를 업데이트한다.
        for i in 0..<datas.count{
            views[i].timeLabel = String(datas[i].time)
            views[i].textLabel = datas[i].text
            views[i].subTextLabel = datas[i].subText!
        }
    }
}
