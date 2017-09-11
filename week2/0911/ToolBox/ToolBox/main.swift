func cmToInch(inputVal: Double)->Double{
    return inputVal / 2.54
}

func cmToM(inputVal: Double)->Double{
    return inputVal / 100
}

func inchToCm(inputVal: Double)->Double{
    return inputVal * 2.54
}

func convertLength(inputType: String, inputVal: Double, outputType: String)->Double{
    var result: Double = 0.0
    if inputType == "cm"{
        if outputType == "inch"{
            result = cmToInch(inputVal: inputVal)
        }else if outputType == "m"{
            result = cmToM(inputVal: inputVal)
        }
    }
    
    if inputType == "inch"{
        if outputType == "cm"{
            result = inchToCm(inputVal: inputVal)
        }
    }
    return result
}

/* 내가 만든 부분 */

func convertInchCm(type: String, val: Double)->Double{
    var result: Double = 0.0
    if type == "A"{
        result = val * 2.54
    }else if type == "B"{
        result = val / 2.54
    }else{
        print("inch to cm --> \"A\"")
        print("cm to inch --> \"B\"")
    }
    return result
}

func convertM2(type: String, val: Double)->Double{
    var result: Double = 0.0
    if type == "A"{
        result = val / 3.3
    }else if type == "B"{
        result = val * 3.3
    }else{
        print("M2 to 평2 --> \"A\"")
        print("평2 to M2 --> \"B\"")
    }
    return result
}

func convertFahCel(type: String, val: Double)->Double{
    var result: Double = 0.0
    if type == "A"{
        result = (val - 32) / 1.8
    }else if type == "B"{
        result = val * 1.8 + 32
    }else{
        print("Fahrenheit to Celcius --> \"A\"")
        print("Celcius to Fahrenheit --> \"B\"")
    }
    return result
}

func convertData(val: Double)->Double{
    var result: Double = 0.0
    result = val / 1024
    
    return result
}

func timeToSec(_ val: Int)->Int{
    var val: Int = val
    var hour: Int = 0
    var min: Int = 0
    var sec: Int = 0
    
    sec = val % 100
    val /= 100
    min = val % 100
    val /= 100
    hour = val % 100
    
    return hour * 3600 + min * 60 + sec
}

func secToTime(_ val: Int)->Int{
    var val: Int = val
    var hour: Int = 0
    var min: Int = 0
    var sec: Int = 0
    
    hour = val / 3600
    val%=3600                  // 또는 val -= hour * 3600
    min = val / 60
    val%=60                    // 또는 val -= min * 60
    sec = val
    
    return hour * 10000 + min * 100 + sec
}

func convertTime(type: String, val: Int)->Int{
    var result: Int = 0
    
    if type == "A"{
        result = timeToSec(val)
    }else if type == "B"{
        result = secToTime(val)
    }else{
        print("hhmmss to seconds --> \"A\"")
        print("seconds to hours --> \"B\"")
    }
    
    return result
}



var aType:Double = 0.0  // aType 결과값을 저장할 전역변수

aType = convertInchCm(type: "A", val: 10)
print(aType)
print(convertInchCm(type: "B", val: aType))

aType = convertM2(type: "A", val: 10)
print(aType)
print(convertM2(type: "B", val: aType))

aType = convertFahCel(type: "A", val: 100)
print(aType)
print(convertFahCel(type: "B", val: aType))

aType = convertData(val: 1048576)
print(aType)
print(convertData(val: aType))

var aTypeInt: Int = convertTime(type: "A", val: 11320)
print(aTypeInt)
print(convertTime(type: "B", val: aTypeInt))

