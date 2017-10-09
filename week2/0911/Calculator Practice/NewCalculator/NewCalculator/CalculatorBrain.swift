//
//  CalculatorBrain.swift
//  NewCalculator
//
//  Created by 심 승민 on 2017. 10. 3..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation
// Model 부분에는 UIKit가 들어가면 안된다~!

class CalculatorBrain{
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double, Double)->Double)
        case Equals
        case Clear
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "±": Operation.UnaryOperation({ -$0 }),
        "×": Operation.BinaryOperation({ $0 * $1 }),
        "÷": Operation.BinaryOperation({ $0 / $1 }),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "=": Operation.Equals,
        "AC": Operation.Clear
    ]
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let foo):
                accumulator = foo(accumulator)
            case .BinaryOperation(let foo):
                executePendingOperation()
                pending = pendingBinaryOperationInfo(operation: foo, firstOperand: accumulator)
            case .Equals:
                executePendingOperation()
            case .Clear:
                accumulator = 0
            }
        }
    }
    
    private func executePendingOperation(){
        if pending != nil{
            accumulator = pending!.operation(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: pendingBinaryOperationInfo?
    
    private struct pendingBinaryOperationInfo {
        var operation: (Double, Double)->Double
        var firstOperand: Double
    }
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
