## 1. Modifier 顺序的影响

在 CalculatorButton 中,我们使用了一系列的 modifiler 来定义按钮和文本的样式:

```swift
var body: some View {     
  return Button(action: action) {         
    Text(title)             
      .font(.system(size: fontSize))             
      .foregroundColor(.white)             
      .frame(width: size.width, height: size.height)             
      .background(Color(backgroundColorName))             
      .cornerRadius(size.width / 2)     
  } 
}
```

我们可以调换 `background` 和 `cornerRadius` 的顺序吗？试试看它会造成什么影响, 并且对结果进行解释说明。另外,我们可以调换 `font` 和 `foregroundColor` 的顺序吗? 它又会有怎么样的影响?

### Solve

如果更换 `background` 和 `cornerRadius` 的顺序，实验结果发现