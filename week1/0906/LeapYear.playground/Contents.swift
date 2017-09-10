func check(leapYear: Int)->Bool{
    if leapYear%4 == 0 && (leapYear%100 != 0 || leapYear%400 == 0){
        return true
    }else{
        return false
    }
}

print(check(leapYear: 2000))
