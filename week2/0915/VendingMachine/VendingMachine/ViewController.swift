//
//  ViewController.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 9. 15..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputMoney: UILabel!
    @IBOutlet weak var informLabel: UILabel!
    
    @IBOutlet weak var menu_coke: UILabel!
    @IBOutlet weak var menu_originalPopcorn: UILabel!
    @IBOutlet weak var menu_doubleCombo: UILabel!
    @IBOutlet weak var menu_sweetCombo: UILabel!
    @IBOutlet weak var menu_nachoCombo: UILabel!
    @IBOutlet weak var menu_cineFamilyCombo: UILabel!
    
    var money: Int = 0 {
        willSet(newValue){
            if newValue == 0{
                inputMoney.text! = "\(newValue)원"
                informLabel.text! = "잔액을 받으세요."
            }else{
                inputMoney.text! = "\(formatter.string(from: newValue as NSNumber)!)원"
            }
        }
    }
    var formatter = NumberFormatter()
    //var machine = VendingMachine()
    
    enum Menus {
        case coke(name: String, price: Int)
        case originalPopcorn(name: String, price: Int)
        case doubleCombo(name: String, price: Int)
        case sweetCombo(name: String, price: Int)
        case nachoCombo(name: String, price: Int)
        case cineFamilyCombo(name: String, price: Int)
    }
    
    //let menus: [String] = ["콜라(중)", "오리지널팝콘(중)", "더블콤보", "스위트콤보", "나쵸즉석구이콤보", "씨네패밀리콤보"]
    
    let menus: [Menus] = [.coke(name: "콜라(중)", price: 2200), .originalPopcorn(name: "오리지널팝콘(중)", price: 4500), .doubleCombo(name: "더블콤보", price: 11000), .sweetCombo(name: "스위트콤보", price: 8500), .nachoCombo(name: "나쵸즉석구이콤보", price: 11000), .cineFamilyCombo(name: "씨네패밀리콤보", price: 17500)]
    var stock: Dictionary<String, Int> = Dictionary()
    var isSoldOut = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 숫자에 콤마를 넣기 위한 fomatter
        formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        //machine = VendingMachine()
        
        // 재고 10개씩 일괄 입력
        for menu in menus{
            print(menu)
            //stock[menu] = 10
        }
        print(stock)
        
        //self.priceButtons!.layer.cornerRadius = 10.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func plus500(_ sender: Any) {
        insertMoney(500)
    }
    
    @IBAction func plus1000(_ sender: Any) {
        insertMoney(1000)
    }
    
    @IBAction func plus5000(_ sender: Any) {
        insertMoney(5000)
    }
    
    @IBAction func plus10000(_ sender: Any) {
        insertMoney(10000)
    }
    
    func insertMoney(_ moneyUnit: Int){
        money += moneyUnit
    }
    
    @IBAction func cancel(_ sender: Any) {
        money = 0
    }
    
    @IBAction func coke(_ sender: Any) {
        operate(2200, menuIdx: 0)
        if isSoldOut == true{
            menu_coke.text = "품절"
            menu_coke.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    @IBAction func originalPopcorn(_ sender: Any) {
        operate(4500, menuIdx: 1)
        if isSoldOut == true{
            menu_originalPopcorn.text = "품절"
            menu_originalPopcorn.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    @IBAction func doubleCombo(_ sender: Any) {
        operate(11000, menuIdx: 2)
        if isSoldOut == true{
            menu_doubleCombo.text = "품절"
            menu_doubleCombo.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    @IBAction func sweetCombo(_ sender: Any) {
        operate(8500, menuIdx: 3)
        if isSoldOut == true{
            menu_sweetCombo.text = "품절"
            menu_sweetCombo.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    @IBAction func nachoCombo(_ sender: Any) {
        operate(11000, menuIdx: 4)
        if isSoldOut == true{
            menu_nachoCombo.text = "품절"
            menu_nachoCombo.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    @IBAction func cineFamilyCombo(_ sender: Any) {
        operate(17500, menuIdx: 5)
        if isSoldOut == true{
            menu_cineFamilyCombo.text = "품절"
            menu_cineFamilyCombo.textColor = UIColor.red
            isSoldOut = false
        }
    }
    
    func operate(_ price: Int, menuIdx: Int){
        
        guard let stock = stock[menus[menuIdx]], let moneyFormatter = formatter.string(from: money as NSNumber) else{ return }
        
        var stockOfMenu = stock
        
        if money < price{
            // 잔액이 부족할 시
            informLabel.text = "잔액이 모자랍니다."
        }else if stockOfMenu < 0{
            // 품절 시
            informLabel.text = "품절입니다."
            isSoldOut = true
        }else{
            // 정상 구매 시
            stockOfMenu -= 1   // 재고-1
            money -= price
            inputMoney.text = "\(moneyFormatter)원"
            informLabel.text = "\(menus[menuIdx])를 받으세요."
        }
    }
}

