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