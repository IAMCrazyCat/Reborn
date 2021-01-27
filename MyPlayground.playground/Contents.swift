//import UIKit
//
//
//class Singleton {
//
//    static let shared = Singleton()
//    var test = 0
//    private init() {
//
//    }
//
//    func getTest() {
//        print(test)
//    }
//}
//
//class test1 {
//    let engine = Singleton.shared
//
//    init() {
//
//    }
//
//    func change()
//    {
//        engine.test = 1
//    }
//}
//
//class test2 {
//    let engine = Singleton.shared
//    init() {
//
//    }
//
//    func get() {
//        print(engine.test)
//    }
//}
//
//test1().change()
//test2().get()
//
//
//var str = "123天"
//var test = str.removeLast()
//print(str)
//
//enum Color: CaseIterable {
//    case red, green, blue
//}
//
//for color in Color.allCases {
//    print("My favorite color is \(color).")
//}
//
//
////var calendar = Calendar.current.startOfDay(for: Date())
//
//var now = Date()
//var future = now
//print(future)
//future += 1 * 60 * 60 * 48
//let dateInterval = DateInterval(start: now, end: future)
//print(dateInterval)
//let diffInDays = Calendar.current.dateComponents([.day], from: now, to: future).date
//
//
//// Replace the hour (time) of both dates with 00:00
//
//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy/MM/dd"
//let someDateTime = formatter.date(from: "2002/5/6")
//let endDateTime = formatter.date(from: "2025/12/31")
//
//
//
//
//
//let startYear = 2012
//let endYear = 2025
//
//
//let calendar = Calendar.current
//for year in startYear ... endYear {
//
//    for month in 1 ... 12 {
//        let dateComponents = DateComponents(year: year, month: month)
//        let date = calendar.date(from: dateComponents)!
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let numDays = range.count
//        print("\(year)年 \(month)月 有 \(numDays)")
//    }
//
//}

var number1 = [Int]()
var number2 = [Int]()

var time = 0

for _ in 1 ... 7 {
    number1.append(Int.random(in: 1 ... 2))
}

while number1 != number2 {
    for _ in 1 ... 7 {
        number2.append(Int.random(in: 1 ... 2))
        
    }
    time += 1
  
}
print(time)


