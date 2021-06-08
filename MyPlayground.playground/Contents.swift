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

//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy-MM"
//


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
//print(Int(1199/600))

extension Array {

    var random: Element? {
        let randomIndex = Int.random(in: 0 ... self.count - 1)
        return self[randomIndex]
    }
}

class State {
    var ID: Int
    var nextStates: Array<State>
    
    init(ID: Int, nextStates: Array<State>) {
        self.ID = ID
        self.nextStates = nextStates
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
    
    
    var currentState: State
    var transitions: Array<Transition> = []
    var S1 = State(ID: 1, nextStates: [])
    var S2 = State(ID: 2, nextStates: [])
    var S3 = State(ID: 3, nextStates: [])
    var S4 = State(ID: 4, nextStates: [])
    
    init() {
        S1.nextStates.append(S2)
        S2.nextStates.append(S3)
        S2.nextStates.append(S1)
        S3.nextStates.append(S2)
        S3.nextStates.append(S4)
        S3.nextStates.append(S1)
        S4.nextStates.append(S3)
        S4.nextStates.append(S1)
        
        currentState = S1
        excuteWalkthrough()
    }
    
    func excuteWalkthrough() {
        for i in 1 ... 1000 {
            
            walkthroughRandomly()
            print(i)
        }
        calculateTransitionPossibility()
    }
    
    func walkthroughRandomly() {
        var path: Array<State> = []
        var startedRunning: Bool = false
        while currentState.ID != 1 || startedRunning == false {
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
            pathStr += "S\(state.ID)->"
        }
        pathStr += "S\(currentState.ID)"
        print(pathStr)
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
            uniqueTransition.possibility = Double(uniqueTransition.numberOfExcutedTimes) / Double(1000)
            print("S\(uniqueTransition.fromState.ID)->S\(uniqueTransition.toState.ID) Possibility: \(uniqueTransition.possibility)")
        }
        
    }
    
    
}

StateMachine()
