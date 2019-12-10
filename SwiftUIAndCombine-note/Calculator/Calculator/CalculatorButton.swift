//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Gua on 2019/12/10.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import SwiftUI

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    let widthMutiply: CGFloat = 1
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width * widthMutiply, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.height / 2)
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorButton(
                title: "Test",
                size: CGSize.init(width: 400, height: 200),
                backgroundColorName: "operatorBackground") {
                    print("hello world")
            }
        }
    }
}
