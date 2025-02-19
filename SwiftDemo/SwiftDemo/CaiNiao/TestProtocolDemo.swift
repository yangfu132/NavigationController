//
//  TestProtocolDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/18.
//

import Foundation

protocol TPSomeProtocolFirst {
    var someProperty:Int { get set }
    func someMethod()
}

protocol TPSomeProtocolSecond {
    var someProperty:Int { get set }
    func someMethod()
}


struct TPSomeStruct:TPSomeProtocolFirst,TPSomeProtocolSecond {
    var someProperty: Int
    
    func someMethod() {
        print("\(someProperty)")
    }
    
    
}


protocol TPProtocolA {
    var marks: Int { get set }
    var result: Bool { get }
    func attendance() -> String
    func markssecured() -> String
}

protocol TPProtocolB: TPProtocolA {
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
}


protocol TPDaysofaweek {
    mutating func show()
}

enum TPDays: TPDaysofaweek {
    mutating func show() {
        switch (self) {
        case .sun:
            self = .sun
            print("Sunday")
        case .mon:
            self = .mon
            print("Monday")
        case .tue:
            self = .tue
            print("Tuesday")
        case .wed:
            self = .wed
            print("Wednesday")
        case .thurs:
            self = .thurs
            print("Thursday")
        case .fri:
            self = .fri
            print("Friday")
        case .sat:
            self = .sat
            print("Saturday")
        }
    }
    
    case sun,mon,tue,wed,thurs,fri,sat
}



class TPClassC: TPProtocolB, TPDaysofaweek {
    func show() {
        subject = "mutating func"
        marks = 98
    }
    
    var present: Bool = false
    
    var subject: String = "Swift 协议"
    
    var stname: String = "Protocols"
    
    var marks: Int = 96
    
    var result: Bool = true
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return "\(stname) has scored \(marks) marks"
    }
}

protocol TPTCPProtocol {
    init(no1: Int)
}

class TPMainClass {
    var no1: Int
    init(no1: Int) {
        self.no1 = no1
    }
}

class TPTCPClass: TPMainClass, TPTCPProtocol {
    var no2: Int
    init(no1:Int, no2:Int) {
        self.no2 = no2
        super.init(no1: no1)
    }
    
    required override convenience init(no1: Int) {
        self.init(no1: no1, no2: 0)
    }
}

class TPPerson {
    let firstname: String
    let lastname: String
    var age: Int

    init(firstname: String, lastname: String, age: Int = 10) {
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
    }
}

protocol TPAgeClassificationProtocol {
    var age: Int { get }
    func agetype() -> String
}

extension TPPerson: TPAgeClassificationProtocol {
    func fullname() -> String {
        return "\(firstname) \(lastname)"
    }
    
    func agetype() -> String {
        switch age {
        case 0...2:
            return "Baby"
        case 3...12: // 修正为从3开始
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}

class TestProtocolDemo {
    func testMain() {
        testProtocol()
        testMutating()
        testInitStruct()
        testInitClass()
        testExtension()
        testOC()
    }
    
    func testOC () {
        let ocDemo = TestProtocolOC()
        ocDemo.testMain()
    }
    
    func testProtocol() {
        let studdet = TPClassC()
        studdet.stname = "Swift"
        studdet.marks = 98

        print(studdet.markssecured())
        print(studdet.attendance())
        print("Marks: \(studdet.marks)")
        print("Result: \(studdet.result)")
        print("Present: \(studdet.present)")
        print("Subject: \(studdet.subject)")
        print("Student Name: \(studdet.stname)")
    }
    
    func testMutating() {
        var res = TPDays.wed
        res.show()
        
        let student = TPClassC()
        student.show()
    }
    
    func testInitStruct() {
        struct StudRecord {
            let stname: String
            
            init!(stname: String) {
                if stname.isEmpty {return nil }
                self.stname = stname
            }
            
            init?(st:String,str:String) {
                if (st.isEmpty || str.isEmpty) {
                    return nil
                }
                self.stname = st + str
            }
        }

        let stmark = StudRecord(stname: "Runoob")
        if let name = stmark {
            print("指定了学生名")
        }

        let blankname = StudRecord(stname: "")
        if blankname == nil {
            print("学生名为空")
        }
        
        var stname = StudRecord(st: "", str: "")
        if stname == nil {
            print("? 为空")
        }
        
        stname = StudRecord(st: "st", str: "str")
        if stname == nil {
            print("? 为空")
        } else {
            print("指定了学生名:\(stname?.stname)")
        }
    }
    
    ///MARK:------ init
    
    func testInitClass() {
        class CStudRecord {
            let stname: String
            
            init!(stname: String) {
                if stname.isEmpty {return nil }
                self.stname = stname
            }
            
            init?(st:String,str:String) {
                if (st.isEmpty || str.isEmpty) {
                    return nil
                }
                self.stname = st + str
            }
        }

        let stmark = CStudRecord(stname: "Runoob")
        if let name = stmark {
            print("指定了学生名")
        }

        let blankname = CStudRecord(stname: "")
        if blankname == nil {
            print("学生名为空")
        }
        
        var stname = CStudRecord(st: "", str: "")
        if stname == nil {
            print("? 为空")
        }
        
        stname = CStudRecord(st: "st", str: "str")
        if stname == nil {
            print("? 为空")
        } else {
            print("指定了学生名:\(stname?.stname)")
        }
    }
    
    func testType() {
        var dictIns = [String:TPSomeStruct]()
        dictIns["TPSomeStruct"] = TPSomeStruct(someProperty: 0)
        
        var dictType = [String:TPSomeProtocolFirst.Type]()
        dictType["TPSomeStruct"] = TPSomeStruct.self
        
    }
    
    func testExtension () {
        // 测试代码
        let person1 = TPPerson(firstname: "John", lastname: "Doe", age: 25)
        let person2 = TPPerson(firstname: "Jane", lastname: "Smith", age: 70)
        let person3 = TPPerson(firstname: "Baby", lastname: "Yoda", age: 1)

        print("\(person1.fullname()) is a \(person1.agetype())")
        print("\(person2.fullname()) is a \(person2.agetype())")
        print("\(person3.fullname()) is a \(person3.agetype())")
    }
    
    func testClass () {
        let one = TPOneOnlyProtocolClass(no1: 0)
        one.printOnly()
        
        let two = TPTwoOnlyProtocolClass(no1: 1)
        two.printOnly()
        
    }
    
    func testMerge() {
        let demoC = TPClassThree()
        testMergeMethod(obj: demoC)
    }
    
    func testMergeMethod(obj:TPProtocolMergeA&TPProtocolMergeB) {
        obj.show()
        obj.eat()
    }
    
    func testAs () {
        let demoC = TPClassThree()
        if let demo = demoC as? TPProtocolMergeA  {
            print("TPProtocolMergeA")
        }
    }
}



protocol TPProtocolMergeA {
    func show()
}

protocol TPProtocolMergeB {
    func eat()
}

protocol TPProtocolMergeC: TPProtocolMergeA, TPProtocolMergeB {
    func run()
}

class TPClassThree: TPProtocolMergeC {
    func run() {
        print("run")
    }
    
    func show() {
        print("show")
    }
    
    func eat() {
        print("eat")
    }
}

protocol TPOneClassOnlyProtocol: TPMainClass, TPTCPProtocol {
    func printOnly()
}

//Using 'class' keyword to define a class-constrained protocol is deprecated; use 'AnyObject' instead
protocol TPTwoClassOnlyProtocol: AnyObject, TPTCPProtocol {
    func printOnly()
}

class TPOneOnlyProtocolClass:TPMainClass, TPOneClassOnlyProtocol {
    func printOnly() {
        print("one only");
    }
    
    required override init(no1: Int) {
        super.init(no1: no1)
    }
}

class TPTwoOnlyProtocolClass:TPTwoClassOnlyProtocol {
    func printOnly() {
        print("two only");
    }
    
    required init(no1: Int) {
        print("two only\(no1)");
    }
}





