import Foundation

// 사칙연산을 위한 Enum
enum Operation {
  case add
  case subtract
  case multiply
  case divide
}

// 각 문자와 Enum에서 만든 인스턴스와 연결?시키기 위한 딕셔너리
let someDictionary: [String: Operation] = [
  "+": Operation.add,
  "-": Operation.subtract,
  "*": Operation.multiply,
  "/": Operation.divide,
]

func performOpertion(num1: Int, num2: Int, symbol: Operation) -> Int {
  
  switch symbol {
  case .add:
    return num1 + num2
  case .subtract:
    return num1 - num2
  case .multiply:
    return num1 * num2
  case .divide:
    return num1 / num2
  }
}

// 함수호출
print(performOpertion(num1: 20, num2: 10, symbol: Operation.add))




// 사칙연산을 위한 Enum이고 연관값으로 함수(클로저)를 받는 Enum
enum OperationClosure {
  case add((Int, Int) -> Int)           // add항목은 연관값으로 두개의 Int를 파라메터로 받아 Int를 반환해주는 함수를 가진다.
  case subtract((Int, Int) -> Int)
  case multiply((Int, Int) -> Int)
  case divide((Int, Int) -> Int)
}

// 각 문자와 Enum에서 만든 인스턴스와 연결?시키기 위한 딕셔너리
let someDictionary2: [String: OperationClosure] = [
  "+": OperationClosure.add(+),
  "-": OperationClosure.subtract(-),
  "*": OperationClosure.multiply(*),
  "/": OperationClosure.divide(/),
]

func performOpertion(num1: Int, num2: Int, symbol: OperationClosure) -> Int {
  
  switch symbol {
  case .add(let addFunction):
    return addFunction(num1, num2)
  case .subtract(let subtrachFunction):
    return subtrachFunction(num1, num2)
  case .multiply(let multiplyFunction):
    return multiplyFunction(num1, num2)
  case .divide(let divideFunction):
    return divideFunction(num1, num2)
  }
}

print(performOpertion(num1: 30, num2: 20, symbol: .add))












