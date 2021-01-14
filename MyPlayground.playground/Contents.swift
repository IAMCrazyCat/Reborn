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


//var calendar = Calendar.current.startOfDay(for: Date())

var now = Date()
var future = now
print(future)
future += 1 * 60 * 60 * 48
let dateInterval = DateInterval(start: now, end: future)
print(dateInterval)
let diffInDays = Calendar.current.dateComponents([.day], from: now, to: future).date

let calendar = Calendar.current

// Replace the hour (time) of both dates with 00:00

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
let someDateTime = formatter.date(from: "2016/10/08")
let endDateTime = formatter.date(from: "2020/10/08")

let date1 = calendar.startOfDay(for: someDateTime!)
let date2 = calendar.startOfDay(for: endDateTime!)

let components = calendar.dateComponents([.calendar], from: date1, to: date2)
