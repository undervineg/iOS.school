func getWeekDay(atMonth: Int, day: Int)->String{
    var totalDays: Int = 0
    var dayArray: [String] = ["일","월","화","수","목","금","토"]
    
    for month in 1..<atMonth{
        if month < 8 {
            if month%2 == 0 && month != 2{
                totalDays += 30
            }else if month%2 != 0{
                totalDays += 31
            }else{
                totalDays += 28
            }
        }else {
            if month%2 == 0{
                totalDays += 30
            }else{
                totalDays += 31
            }
        }
    }
    
    totalDays += day
    
    return dayArray[(totalDays-1)%7]
}

//print(getWeekDay(atMonth: 4, day: 1))


func shorter(num: Int)->Int{
    var numArr: [Int] = []
    var num: Int = num
    var resultArr: [Int] = []
    while num > 0{
        numArr.insert(num%10, at: 0)
        num /= 10
    }
    
    for i in 1..<numArr.count{
        if numArr[i-1] != numArr[i]{
            resultArr.append(numArr[i-1])
        }else if i == numArr.count-1{
            resultArr.append(numArr[i-1])
        }
    }
    /*
    var idx = 0
    for _ in 1..<numArr.count{
        if numArr[idx] == numArr[idx+1]{
            numArr.remove(at: idx)
        }else{
            idx += 1
        }
    }
    */
    var returnStr: String = ""
    for result in resultArr{
        returnStr += String(result)
    }
    
    return Int(returnStr)!
}

//print(shorter(num: 1002233422))


func allPrimeNumber(endNum: Int)->[Int]{
    var primeNums: [Int] = []
    var allNums: Set<Int> = Set<Int>()
    
    for checkNum in 2...endNum{
        if !allNums.contains(checkNum){
            primeNums.append(checkNum)
            
            var num: Int = checkNum * 2 // 2를 안 곱해도 나오던데.. 왜이지?
            while num <= endNum {
                num += checkNum
                allNums.insert(num)
            }
        }
    }
    return primeNums
}

print(allPrimeNumber(endNum: 15))


func mkNewIdx(array: [String], data: String, keyNum: Int)->String{
    var newIndex: Int = 0
    newIndex = array.index(of: data)! + keyNum
    if newIndex/array.count > 0{
        newIndex %= array.count
    }
    
    return array[newIndex]
}

func ceasar(data: [String], keyNum: Int)->[String]{
    var returnArr: [String] = []
    let upperAlphabet: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let lowerAlphabet: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    for elem in data{
        if upperAlphabet.contains(elem){
            returnArr.append(mkNewIdx(array: upperAlphabet, data: elem, keyNum: keyNum))
        }else if lowerAlphabet.contains(elem){
            returnArr.append(mkNewIdx(array: lowerAlphabet, data: elem, keyNum: keyNum))
        }
    }
    
    return returnArr
}

print(ceasar(data: ["U","u","Z","z"], keyNum: 4))


