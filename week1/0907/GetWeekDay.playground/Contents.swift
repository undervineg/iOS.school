import Foundation

func getWeekDay(_ atMonth: Int, _ day: Int)->String{
    var returnDay: String = ""
    var dayArray: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var days: Int = 0
    for month in 1..<atMonth{
        if month%2 != 0{
            days += 31
        }else if month%2==0 && month != 2{
            days += 30
        }else if month == 2{
            days += 28
        }
    }
    days += day
    days += 6
    returnDay = dayArray[days%7]
    return returnDay
}

print(getWeekDay(3, 4))