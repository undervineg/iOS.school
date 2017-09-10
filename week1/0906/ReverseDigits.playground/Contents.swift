func revers(num: Int)->Int{
    var result: String = ""
    var number: Int = num
    while number > 0 {
        result += String(number % 10)
        number = number / 10
    }
    return Int(result)!
}

print(revers(num: 123))
