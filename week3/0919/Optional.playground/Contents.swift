func testFunc(optionalStr: String?, inputNum: Int?){
    if let unwrapStr = optionalStr, let unwrapNum = inputNum{
        print(unwrapStr)
        print(unwrapNum)
    }else{
        print("nil")
    }
}

testFunc(optionalStr: "ㅎㅎ", inputNum: nil)


func guardFunc(optionalStr: String?){
    guard let opt = optionalStr else{
        return
    }
    
    print(opt)
}

guardFunc(optionalStr: "hi")