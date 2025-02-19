//
//  MSEnumDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/17.
//

import Foundation

// 定义枚举
enum MSEDaysofaWeek:Int {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
    func testDaySwitch() -> String {
        var result = ""
        switch self {
        case .Sunday:
            result = "星期天"
            print("星期天")
        case .Monday:
            result = "星期一"
            print("星期一")
        case .TUESDAY:
            result = "星期二"
            print("星期二")
        case .WEDNESDAY:
            result = "星期三"
            print("星期三")
        case .THURSDAY:
            result = "星期四"
            print("星期四")
        case .FRIDAY:
            result = "星期五"
            print("星期五")
        case .Saturday:
            result = "星期六"
            print("星期六")
        }
        
        return result
    }
}

enum MSEDaysofaWeekTwo {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}

enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}


class MSEnumDemo {
    func testMain() {
        testDayEqual()
        testStudentEqual()
        testEnumEqual()
    }
    
    func testDayEqual() {
        let weekDay = MSEDaysofaWeek.Sunday
        testDaySwitch(weekDay: weekDay, day:MSEDaysofaWeek.Sunday)
        
        let weekDayTwo = MSEDaysofaWeekTwo.Sunday
        testDayTwoSwitch(weekDay: weekDayTwo, day:MSEDaysofaWeekTwo.Sunday)
    }
    
    func testDayTwoSwitch(weekDay:MSEDaysofaWeekTwo?, day:MSEDaysofaWeekTwo?) {
        if (weekDay == day) {
            print("Equal 星期天")
        }
    }
    
    func testDaySwitch(weekDay:MSEDaysofaWeek?, day:MSEDaysofaWeek?) {
        
        if (weekDay == day) {
            print("Equal 星期天")
        }
        
        if (MSEDaysofaWeek.Sunday == weekDay) {
            print("Equal 星期天")
        }
        
        if (MSEDaysofaWeek.Saturday.rawValue == 1) {
            print("Equal 星期天")
        }
        
        switch weekDay {
        case .Sunday:
            print("星期天")
        case .Monday:
            print("星期一")
        case .TUESDAY:
            print("星期二")
        case .WEDNESDAY:
            print("星期三")
        case .THURSDAY:
            print("星期四")
        case .FRIDAY:
            print("星期五")
        case .Saturday:
            print("星期六")
        case .none:
            print("none")
        }
        
        
    }
    
    func testStudentEqual() {
        var studDetails = Student.Name("Runoob")
        var studMarks = Student.Mark(98,97,95)
        testStudentSwitch(stud:studDetails)
        testStudentSwitch(stud:studMarks)
        testStudentIf(studOne:studDetails,studTwo:studMarks)
        testEnumEqualSwitch(studOne:studDetails,studTwo:studMarks)
    }
    
    func testStudentSwitch(stud:Student?) {
        switch stud {
        case .Name(let studName):
            print("学生的名字是: \(studName)。")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        case .none:
            print("none")
        }
    }
    
    func testStudentIf(studOne:Student?,studTwo:Student?) {
        if let tempOne = studOne {
            if case Student.Name(let name) = tempOne {
                print(name)
            } else if case Student.Mark(let mark1, let mark2, let mark3) = tempOne {
                print("mark:\(mark1),\(mark2),\(mark3)")
            }
        }
        
        if let tempTwo = studTwo {
            if case Student.Name(let name) = tempTwo {
                print(name)
            } else if case Student.Mark(let mark1, let mark2, let mark3) = tempTwo {
                print("mark:\(mark1),\(mark2),\(mark3)")
            }
        }
    }
    
    func testEnumEqualSwitch(studOne:Student?,studTwo:Student?) -> Bool {
        switch (studOne,studTwo) {
        case (.none,.none):
            return true
        case let (.Mark(a1, a2, a3), .Mark(b1, b2, b3)):
            if ((a1 == b1 ) && (a2 == b2 ) && (a3 == b3 ) ) {
                return true
            } else {
                return false
            }
        case let (.Name(a), .Name(b)):
            if (a == b){
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
    
    func testEnumEqual() {
        // 自定义类型的使用
        enum Shape {
            case square(width: Double)
            case circle(radius: Double, borderWidth:Double)
        }

        let s = Shape.square(width: 10)
        let c = Shape.circle(radius: 20, borderWidth: 1)

        // 判断s是否是square类型。并获取`关联内容`
        // 1. 内部声明关联内容类型(如: let)
        if case .square(let width) = s {
            print(width)
        }

        // 2. 声明case所有关联内容类型(如: var)
        if case var .circle(radius, borderWidth) = c {
            radius += 200
            borderWidth += 100
            print(radius, borderWidth)
        }
    }
}
