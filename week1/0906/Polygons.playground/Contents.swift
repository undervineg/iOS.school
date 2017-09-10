import Foundation

let PI: Double = 3.14

func errorStmt()->Int{
    print("면적은 A, 둘레는 P, 원의 둘레는 C, 부피는 V 타입을 지정해주세요.")
    return 0
}

func mkSquare(type: String, width: Double) -> Double {
    var returnValue: Double = 0.0
    if(type == "A"){
        returnValue = width * width
    }else if(type == "P"){
        returnValue = 4 * width
    }else{
        errorStmt()
    }
    
    return returnValue
}

func mkRectangle(type: String, length: Double, width: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "A"){
        returnValue = length * width
    }else if(type == "P"){
        returnValue = 2 * (length + width)
    }else{
        errorStmt()
    }
    return returnValue
}

func mkCircle(type: String, radius: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "A"){
        returnValue = PI * radius * radius
    }else if(type == "C"){
        returnValue = 2 * PI * radius
    }else{
        errorStmt()
    }
    return returnValue
}

func mkTriangle(type: String, base: Double, height: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "A"){
        returnValue = 1/2 * base * height
    }else{
        errorStmt()
    }
    return returnValue
}

func mkTrapezold(type: String, a: Double, b: Double, height: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "A"){
        returnValue = 1/2 * height * (a + b)
    }else{
        errorStmt()
    }
    return returnValue
}

func mkCube(type: String, side: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "V"){
        returnValue = side * side * side
    }else{
        errorStmt()
    }
    return returnValue
}

func mkRectangularSolid(type: String, length: Double, width: Double, height: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "V"){
        returnValue = length * width * height
    }else{
        errorStmt()
    }
    return returnValue
}

func mkCircularCylinder(type: String, radius: Double, height: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "V"){
        returnValue = PI * radius * radius * height
    }else{
        errorStmt()
    }
    return returnValue
}

func mkSphere(type: String, radius: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "V"){
        returnValue = 4/3 * PI * radius * radius * radius
    }else{
        errorStmt()
    }
    return returnValue
}

func mkCone(type: String, radius: Double, height: Double)->Double{
    var returnValue: Double = 0.0
    if(type == "V"){
        returnValue = 1/3 * PI * radius * radius * height
    }else{
        errorStmt()
    }
    return returnValue
}


let areaType: String = "A"
let perimeterType: String = "P"
let circumType: String = "C"
let volumeType: String = "V"

var squareA = mkSquare(type: areaType, width: 10)
var squareP = mkSquare(type: perimeterType, width: 10)
var rectA = mkRectangle(type: "Q", length: 10, width: 15)
var rectP = mkRectangle(type: "P", length: 10, width: 15)
var circleA = mkCircle(type: "A", radius: 5)
var circleC = mkCircle(type: "C", radius: 5)
var triangleA = mkTriangle(type: "A", base: 10, height: 5)
var trapeA = mkTrapezold(type: "A", a: 5, b: 3, height: 4)
var cubeV = mkCube(type: "V", side: 5)
var rectSolidV = mkRectangularSolid(type: "V", length: 4, width: 2, height: 3)
var cylinderV = mkCircularCylinder(type: "V", radius: 5, height: 10)
var sphereV = mkSphere(type: "V", radius: 5)
var coneV = mkCone(type: "V", radius: 5, height: 10)