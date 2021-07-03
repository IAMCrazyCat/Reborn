//import UIKit
//import Foundation
//
////class Singleton {
////
////    static let shared = Singleton()
////    var test = 0
////    private init() {
////
////    }
////
////    func getTest() {
////        print(test)
////    }
////}
////
////class test1 {
////    let engine = Singleton.shared
////
////    init() {
////
////    }
////
////    func change()
////    {
////        engine.test = 1
////    }
////}
////
////class test2 {
////    let engine = Singleton.shared
////    init() {
////
////    }
////
////    func get() {
////        print(engine.test)
////    }
////}
////
////test1().change()
////test2().get()
////
////
////var str = "123天"
////var test = str.removeLast()
////print(str)
////
////enum Color: CaseIterable {
////    case red, green, blue
////}
////
////for color in Color.allCases {
////    print("My favorite color is \(color).")
////}
////
////
//////var calendar = Calendar.current.startOfDay(for: Date())
////
////var now = Date()
////var future = now
////print(future)
////future += 1 * 60 * 60 * 48
////let dateInterval = DateInterval(start: now, end: future)
////print(dateInterval)
////let diffInDays = Calendar.current.dateComponents([.day], from: now, to: future).date
////
////
////// Replace the hour (time) of both dates with 00:00
////
////let formatter = DateFormatter()
////formatter.dateFormat = "yyyy/MM/dd"
////let someDateTime = formatter.date(from: "2002/5/6")
////let endDateTime = formatter.date(from: "2025/12/31")
////
////
////
////
////
////let startYear = 2012
////let endYear = 2025
////
////
////let calendar = Calendar.current
////for year in startYear ... endYear {
////
////    for month in 1 ... 12 {
////        let dateComponents = DateComponents(year: year, month: month)
////        let date = calendar.date(from: dateComponents)!
////        let range = calendar.range(of: .day, in: .month, for: date)!
////        let numDays = range.count
////        print("\(year)年 \(month)月 有 \(numDays)")
////    }
////
////}
//
////let formatter = DateFormatter()
////formatter.dateFormat = "yyyy-MM"
////
//
//
////let calendar = Calendar.current
////let time = calendar.dateComponents([.hour,.minute,.second], from: Date())
////let morning = ["8:00:00", "12:00:00"]
////
////var testTime = DateComponents()
////testTime.hour = 8
////testTime.minute = 0
////testTime.second = 0
//
////print(time.hour! > testTime.hour!)
//
//
////let date = Date()
////
////// Define which date components that we want to be considered
////// when looking for tomorrow’s date. This essentially decides
////// what level of precision that we’d like:
//
////)
////
////let tomorrow = calendar.nextDate(
////    after: date,
////    matching: components,
////    matchingPolicy: .nextTime
////)
//
////let calendar = Calendar.current
////let date = calendar.date(byAdding: .day, value: 20, to: Date())
////let components = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
////print(components.day)
////
////1 % 12
////Radiance
////print(GLKMathDegreesToRadians(360))
//
////let date = Date()
////let calendar = NSCalendar.current
////let components = calendar.dateComponents([.nanosecond], from: date)
////let nanoSeconds = components.nanosecond
//
////let d1 = Date()
////let df = DateFormatter()
////df.dateFormat = "y-MM-dd H:m:ss.SSSS"
////let d2 = df.date(from: "2021-05-03 9:30:00.1234")!
////
////print(df.string(from: d1))
////print(df.string(from: d2))
////let components = Calendar.current.dateComponents([.second, .nanosecond], from: d1, to: d2)
////let totolNanoSeconds = components.second! * 1000000 + components.nanosecond!
////print(totolNanoSeconds)
////print(Int(1199/600))
//
extension Array {

    var random: Element? {
        let randomIndex = Int.random(in: 0 ... self.count - 1)
        return self[randomIndex]
    }
   
}

class State {
    var ID: Int
    var nextStates: Array<State>
    var description: String?
    init(ID: Int, nextStates: Array<State>, description: String? = nil) {
        self.ID = ID
        self.nextStates = nextStates
        self.description = description
    }
}

class Transition: Equatable {
    static func == (lhs: Transition, rhs: Transition) -> Bool {
        lhs.fromState.ID == rhs.fromState.ID && lhs.toState.ID == rhs.toState.ID
    }

    var fromState: State
    var toState: State

    var numberOfExcutedTimes: Int = 0
    var possibility: Double = 0
    var toString: String {
        return "S\(fromState.ID)->\(toState.ID)"
    }

    init(from: State, to: State) {
        self.fromState = from
        self.toState = to
    }
}

class StateMachine {

    let executionTimes: Int = 1000
    var currentState: State
    var transitions: Array<Transition> = []
    var states: Array<State> = []
    var S1 = State(ID: 1, nextStates: [], description: "1.0")
    var S2 = State(ID: 2, nextStates: [], description: "1.1")
    var S3 = State(ID: 3, nextStates: [], description: "1.1.1")
    var S4 = State(ID: 4, nextStates: [], description: "1.2.0")
    var S5 = State(ID: 5, nextStates: [], description: "1.2.1")
    var S6 = State(ID: 6, nextStates: [], description: "1.3.1")
    var S7 = State(ID: 7, nextStates: [], description: "1.3.2")
    var S8 = State(ID: 8, nextStates: [], description: "1.3.3")
    var S9 = State(ID: 9, nextStates: [], description: "1.4.0")
    
    init() {
//        states.append(S1)
//        states.append(S2)
        states.append(S3)
        states.append(S4)
        states.append(S5)
        states.append(S6)
        states.append(S7)
        states.append(S8)
        states.append(S9)
        
        
        for state in states {
            for nextState in states {
                if nextState.ID > state.ID {
                    state.nextStates.append(nextState)
                }
            }
            print(state.ID)
            print(state.nextStates.description)
        }
        S9.nextStates.append(S9)
        currentState = states.random!
        excuteWalkthrough()
    }

    func excuteWalkthrough() {
        for i in 1 ... executionTimes {
            currentState = states.random!
            walkthroughRandomly()
            print(i)
        }
        calculateUniquePaths()
        //calculateTransitionPossibility()
    }
    
    var paths: Array<String> = []
    
    func walkthroughRandomly() {
        var path: Array<State> = []
        var startedRunning: Bool = false
        while currentState.ID != 9 || startedRunning == false {
            let fromState: State = currentState
            let toState: State
            !startedRunning ? startedRunning = true : ()
            path.append(currentState)
            currentState = currentState.nextStates.random!
            toState = currentState
            transitions.append(Transition(from: fromState, to: toState))
        }
        
        
        var pathStr = ""
        for state in path {
            pathStr += "v\(state.description!)->"//"S\(state.ID)->"
        }
        pathStr += "v\(currentState.description!)"//"S\(currentState.ID)"
        paths.append(pathStr)
    }

    func calculateTransitionPossibility() {

        var uniqueTansitions: Array<Transition> = []
        uniqueTansitions.append(transitions.first!)
        for transition in transitions {

            var transitionAlreadyExist = false
            for uniqueTransition in uniqueTansitions {
                print("\(transition.toString) \(uniqueTransition.toString) \(transition == uniqueTransition)")
                if transition == uniqueTransition{
                    uniqueTransition.numberOfExcutedTimes += 1
                    transitionAlreadyExist = true
                }
            }

            transitionAlreadyExist ? () : uniqueTansitions.append(transition)

        }

        for uniqueTransition in uniqueTansitions {
            uniqueTransition.possibility = Double(uniqueTransition.numberOfExcutedTimes) / Double(executionTimes)
            print("S\(uniqueTransition.fromState.ID)->S\(uniqueTransition.toState.ID) Possibility: \(uniqueTransition.possibility)")
        }

    }
    
    
    func calculateUniquePaths() {
        print("总测试路径：\(uniqueElementsFrom(array: self.paths).count)条")
        var number = 0
        for uniquePath in uniqueElementsFrom(array: self.paths) {
            print(uniquePath)
            number += 1
        }
    }
    
    
    func uniqueElementsFrom(array: [String]) -> [String] {
      //Create an empty Set to track unique items
      var set = Set<String>()
      let result = array.filter {
        guard !set.contains($0) else {
          //If the set already contains this object, return false
          //so we skip it
          return false
        }
        //Add this item to the set since it will now be in the array
        set.insert($0)
        //Return true so that filtered array will contain this item.
        return true
      }
      return result
    }


}

StateMachine()

//import Foundation
//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy MM dd"
//
//let date = formatter.date(from: "\(2021) \(6) \(5)")
//var weekday = Calendar.current.component(.weekday, from: date!)
//
//if weekday <= 1 {
//    weekday = 7
//} else {
//    weekday -= 1
//}
//print(weekday)

//let originalMonth = 12
//let monthDifference = -13
//
//var newMonth = originalMonth + (monthDifference % 12)
//
//if newMonth > 12 {
//    newMonth = 1
//} else if newMonth == 0 {
//    newMonth = 12
//} else if newMonth < 0 {
//    newMonth = 12 - newMonth
//}
//
//print(newMonth)

//import UIKit
//
//func heightForView(text: String, font: UIFont, width: CGFloat) -> CGFloat{
//    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
//    label.numberOfLines = 0
//    label.lineBreakMode = NSLineBreakMode.byWordWrapping
//    label.font = font
//    label.text = text
//
//    label.sizeToFit()
//    return label.frame.height
//}
//
//heightForView(text: "WTFWTWFWFWTWGWHWWTFWTWFWFWTWGWHW", font: UIFont.systemFont(ofSize: 12), width: 100)
//heightForView(text: "WTFWTWFWFWTWW", font: UIFont.systemFont(ofSize: 12), width: 100)
