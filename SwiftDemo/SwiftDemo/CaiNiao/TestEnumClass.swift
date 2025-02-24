//
//  TestEnumClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/28.
//

import Foundation

class TestEnumClass {
    func testEnum() {
        testCreate()
        testOrigin()
        testRaw()
    }
    
    func testCreate() {
        enum DaysofaWeak{
            case Sunday
            case Monday
            case Tuesday
            case Wedensday
            case Thursday
            case Friday
            case Saturday
        }
        
        var weekDay = DaysofaWeak.Thursday
        weekDay = .Thursday
        switch weekDay {
        case .Sunday:
            print("星期天")
            break
        case .Monday:
            print("星期一")
        case .Tuesday:
            print("星期二")
        case .Wedensday:
            print("星期三")
        case .Thursday:
            print("星期四")
        case .Friday:
            print("星期五")
        case .Saturday:
            print("星期六")
        }
    }
    
    func testOrigin() {
        enum Student {
            case Name(String)
            case Mark(Int,Int,Int)
        }
        
        var studDetails = Student.Name("Runoob")
        var studMarks = Student.Mark(98, 97, 95)
        
        switch studMarks {
        case .Name(let studName):
            print("name is \(studName)")
        case .Mark(let Makr1, let Makr2, let Makr3):
            print("mark is \(Makr1),\(Makr2),\(Makr3)")
            
        }
    }
    
    func testRaw() {
        enum Month:Int {
            case January = 1
            case February = 2
            case March = 5,November, December
        }
        
        let yearMonth = Month.March.rawValue
        print("数字月份为: \(yearMonth)。")
    }
    
}
