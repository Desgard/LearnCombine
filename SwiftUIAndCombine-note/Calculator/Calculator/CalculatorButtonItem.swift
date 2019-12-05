//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by Harry Twan on 2019/12/3.
//  Copyright © 2019 Harry Twan. All rights reserved.
//
import UIKit

enum CalculatorButtonItem {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case mutiply = "×"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

// 这里可以直接抽象出一个 viewModel
extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case let .digit(value) = self, value == 0 {
            return CGSize(width: 88 * 2, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "commandBackground"
        }
    }
}

extension CalculatorButtonItem: Hashable {}
