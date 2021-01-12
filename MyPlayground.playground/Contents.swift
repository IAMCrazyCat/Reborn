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


var calendar = Calendar.current.startOfDay(for: Date())

var now = Date()
var future = now
print(future)
future += 1 * 60 * 60 * 24
let dateInterval = DateInterval(start: now, end: future)
print(future)
print(calendar)
