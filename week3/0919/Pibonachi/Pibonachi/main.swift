func factorial(num: Int)->Int{
    var total: Int = num
    
    if num == 0{
        return 1
    }
    
    total *= factorial(num: num-1)
    
    return total
}

factorial(num: 3)



func pibonachi(_ num: Int)->Int{
    
    return (num == 1 || num == 2) ? 1 : pibonachi(num-2) + pibonachi(num-1)
    
}

print(pibonachi(7))
