//
//  ContentView.swift
//  Calculator
//
//  Created by Harry Twan on 2019/12/3.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let keyPad: [[CalculatorButtonItem]] = [
        [ .command(.clear), .command(.flip), .command(.percent), .op(.divide) ],
        [ .digit(4), .digit(5), .digit(6), .op(.minus) ],
        [ .digit(1), .digit(2), .digit(3), .op(.plus) ],
        [ .digit(0), .dot, .op(.equal) ]
    ]

    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Text("0")
                .font(.system(size: 76))
            ForEach(keyPad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName
                ) {
                    print("Buton: \(item.title)")
                }
            }
        }
    }
}

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

