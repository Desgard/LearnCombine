//
//  ContentView.swift
//  Calculator
//
//  Created by Harry Twan on 2019/12/3.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    @ObservedObject var model = CalculatorModel()
    
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作历史: \(model.history.count)") {
                print(self.model.history)
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            CalculatorButtonPad(model: model)
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
    
    var model: CalculatorModel

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
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    var model: CalculatorModel
    
//    @Binding var brain: CalculatorBrain
    
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
                CalculatorButtonRow(model: self.model, row: row)
            }
        }
    }
}


struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有记录")
            } else {
                HStack {
                    Text("记录")
                        .font(.headline)
                    Text("\(model.historyDetail)")
                        .lineLimit(nil)
                }
                HStack {
                    Text("显示")
                        .font(.headline)
                    Text("\(model.brain.output)")
                }
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                ).padding()
            }
        }
    }
}

