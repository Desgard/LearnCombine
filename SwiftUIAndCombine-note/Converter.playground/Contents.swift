
@propertyWrapper struct Converter {
    let from: String
    let to: String
    let rate: Double
    
    var value: Double
    
    var wrappedValue: String {
        get { "\(from) \(value)" }
        set { value = Double(newValue) ?? -1 }
    }
    
    var projectedValue: String {
        return "\(to) \(value * rate)"
    }
    
    init(initialValue: String, from: String, to: String, rate: Double) {
        self.rate = rate
        self.value = 0
        self.from = from
        self.to = to
        self.wrappedValue = initialValue
    }
}

struct Test {
    @Converter(initialValue: "100", from: "USD", to: "CNY", rate: 6.88)
    var usd_cny
    
    @Converter(initialValue: "100", from: "CNY", to: "EUR", rate: 0.13)
    var cny_eur
    
    init() {
        print($usd_cny)
        print(usd_cny)
    }
}

Test()

