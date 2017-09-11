func collatz(_ num: Int)->Int{
    var num: Int = num
    var idx: Int = 0
    while num > 1{
        print(num)
        if num % 2 == 0{
            num /= 2
        }else{
            num = num * 3 + 1
        }

        if idx > 500 && num != 1 {
            return -1
        }
        idx += 1
    }
    return idx
}


var result = collatz(123286325789578297)
if result > 0 {
    print("몇 번만에 1이 되었는가? : \(result)번")
}else{
    print("500번이 넘어도 1이 되지 않았습니다.")
}

