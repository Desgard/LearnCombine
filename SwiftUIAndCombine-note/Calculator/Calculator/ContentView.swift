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
    
    @State private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            CalculatorButtonPad(brain: $brain)
                .padding(.bottom)
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
    
    @Binding var brain: CalculatorBrain
    
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
                    self.brain = self.brain.apply(item: item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    @Binding var brain: CalculatorBrain
    
    let keyPad: [[CalculatorButtonItem]] = [
        [ .command(.clear), .command(.flip), .command(.percent), .op(.divide) ],
        [ .digit(7), .digit(8), .digit(9), .op(.multiply) ],
        [ .digit(4), .digit(5), .digit(6), .op(.minus) ],
        [ .digit(1), .digit(2), .digit(3), .op(.plus) ],
        [ .digit(0), .dot, .op(.equal) ]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(keyPad, id: \.self) { row in
                CalculatorButtonRow(brain: self.$brain, row: row)
            }
        }
    }
}



