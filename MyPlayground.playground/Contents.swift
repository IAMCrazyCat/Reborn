import UIKit
import Foundation

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

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM"



//let calendar = Calendar.current
//let time = calendar.dateComponents([.hour,.minute,.second], from: Date())
//let morning = ["8:00:00", "12:00:00"]
//
//var testTime = DateComponents()
//testTime.hour = 8
//testTime.minute = 0
//testTime.second = 0

//print(time.hour! > testTime.hour!)


//let date = Date()
//
//// Define which date components that we want to be considered
//// when looking for tomorrow’s date. This essentially decides
//// what level of precision that we’d like:

//)
//
//let tomorrow = calendar.nextDate(
//    after: date,
//    matching: components,
//    matchingPolicy: .nextTime
//)

//let calendar = Calendar.current
//let date = calendar.date(byAdding: .day, value: 20, to: Date())
//let components = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
//print(components.day)
//
//1 % 12
//Radiance
//print(GLKMathDegreesToRadians(360))

//let date = Date()
//let calendar = NSCalendar.current
//let components = calendar.dateComponents([.nanosecond], from: date)
//let nanoSeconds = components.nanosecond

//let d1 = Date()
//let df = DateFormatter()
//df.dateFormat = "y-MM-dd H:m:ss.SSSS"
//let d2 = df.date(from: "2021-05-03 9:30:00.1234")!
//
//print(df.string(from: d1))
//print(df.string(from: d2))
//let components = Calendar.current.dateComponents([.second, .nanosecond], from: d1, to: d2)
//let totolNanoSeconds = components.second! * 1000000 + components.nanosecond!
//print(totolNanoSeconds)
print(Int(1199/600))
