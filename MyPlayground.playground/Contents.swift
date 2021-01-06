import UIKit


class Singleton {
    
    static let shared = Singleton()
    var test = 0
    private init() {
        
    }
    
    func getTest() {
        print(test)
    }
}

class test1 {
    let engine = Singleton.shared
    
    init() {
        
    }
    
    func change()
    {
        engine.test = 1
    }
}

class test2 {
    let engine = Singleton.shared
    init() {
        
    }
    
    func get() {
        print(engine.test)
    }
}

test1().change()
test2().get()


var str = "123天"
var test = str.removeLast()
print(str)

enum Color: CaseIterable {
    case red, green, blue
}

for color in Color.allCases {
    print("My favorite color is \(color).")
}
