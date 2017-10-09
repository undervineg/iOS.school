//
//  FaceView.swift
//  FaceIt
//
//  Created by 심 승민 on 2017. 10. 9..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class FaceView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        //var skullCenter = convert(center, from: superview)    // 상위뷰의 center값을 현재뷰에 맞춰 변환
        
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        UIColor.green.set()
        path.lineWidth = 5.0
        path.stroke()
    }
 

}
