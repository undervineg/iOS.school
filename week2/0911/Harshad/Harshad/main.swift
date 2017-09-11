func harshad(_ n: Int)->Bool{
    var result: Bool = false
    var num: Int = n
    var sum: Int = 0
    while num > 0{
        sum += num % 10
        num /= 10
    }
    
    if n % sum == 0{
        result = true
    }
    
    return result
}

print(harshad(10))
print(harshad(12))
print(harshad(18))
print(harshad(11))
print(harshad(13))
