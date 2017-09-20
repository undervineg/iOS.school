//: Playground - noun: a place where people can play

import Foundation

func getGrade(withPoint point: Double)->String{
    print(point)
    var grade: String = "F"
    switch point {
    case let p where (p<=100 && p>90):
        grade = "A+"
    case let p where (p<90 && p>=80):
        grade = "A"
    case let p where (p<80 && p>=70):
        grade = "B+"
    case let p where (p<70 && p>=60):
        grade = "B"
    default:
        grade = "F"
    }
    
    return grade
}

func getGrade2(withPoint point: Double)->String{
    print(point)
    var grade: String = "F"
    switch point {
    case 90...100:
        grade = "A+"
    case 80..<90:
        grade = "A"
    case 70..<80:
        grade = "B+"
    case 60..<70:
        grade = "B"
    default:
        grade = "F"
    }
    
    return grade
}

print(getGrade(withPoint: 92.3))
print(getGrade2(withPoint: 92.3))