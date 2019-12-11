//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Gua on 2019/12/11.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import SwiftUI
import Combine

class CalculatorModel: ObservableObject {
    @Published var brain: CalculatorBrain = .left("0")
    
//    let objectWillChange = PassthroughSubject<Void, Never>()
//
//    var brain: CalculatorBrain = .left("0") {
//        willSet { objectWillChange.send() }
//    }
    
    @Published var history: [CalculatorButtonItem] = []
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
    }
}
