//
//  ContentView.swift
//  Calculator
//
//  Created by Harry Twan on 2019/12/3.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            CalculatorButtonPad()
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone SE")
        }
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

struct CalculatorButtonPad: View {
    let keyPad: [[CalculatorButtonItem]] = [
        [ .command(.clear), .command(.flip), .command(.percent), .op(.divide) ],
        [ .digit(4), .digit(5), .digit(6), .op(.minus) ],
        [ .digit(1), .digit(2), .digit(3), .op(.plus) ],
        [ .digit(0), .dot, .op(.equal) ]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(keyPad, id: \.self) { row in
                CalculatorButtonRow(row: row)
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
                .cornerRadius(size.height / 2)
                .background(Color(backgroundColorName))
        }
    }
}

