import Foundation

func shorter(_ num: Int)->String{
    var number: Int = num
    var list: [Int] = []
    var returnVal: String = ""
    
    while 0 < number {
        list.insert(number%10, at: 0)  // insert 함수를 사용하면 삽입 위치를 지정할 수 있어 첫 칸부터 추가할 수 있음
        number /= 10
    }
    print(list)
    
    var idx = 0
    for _ in 1..<list.count{
        if list[idx] == list[idx+1]{
            list.remove(at: idx)
        }else{
            idx += 1
        }
    }
    print(list)
    
    
    // 배열을 숫자로 바꾸려면 배열을 각각 돌면서 *10 하는 함수를 만들어서 또 *10 하면 됨
    for i in 0..<list.count{
        returnVal += String(list[i])
    }
    
    return returnVal
}

print(shorter(1002233444))
