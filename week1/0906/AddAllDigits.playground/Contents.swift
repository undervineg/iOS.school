func addAllDigit(num: Int)->Int{
    var sum: Int = 0
    var number: Int = num
    
    var isNe: Bool = false
    if num < 0 {
        isNe = true
        number *= -1
    }
    
    while number > 0 {
        sum += number % 10
        number /= 10
    }
    
    if isNe == true{
        sum *= -1
    }
    
    return sum
}


// Double형으로 들어온 경우도 만들어보기
func addAllDigit(num: Double)->Int{
    var sum: Int = 0
    var number: Double = num
    while num.divide(by: 10.0) < 1{
        
    }
    
    return sum
}

print(addAllDigit(num: 123.456))
