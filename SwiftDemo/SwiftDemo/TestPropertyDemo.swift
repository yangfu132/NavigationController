//
//  TestPropertyDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/26.
//

import Foundation

let globleString = "globleString"

struct Number {
    var digits:Int
    let pi = 3.1415926
    lazy var lazyDigits:Int = 123456
    let somePi:Double
    init(digits:Int) {
        self.digits = digits
        somePi = 3.14
    }
}

class sample {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    
    var middle: (Double, Double) {
        get{
            return (length / 2, breadth / 2)
        }
        set(axis){
            no1 = axis.0 - (length / 2)
            no2 = axis.1 - (breadth / 2)
        }
    }
    
    var origin: [String:Double] {
        return [
            "no1": self.no1,
            "no2": self.no2,
        ]
    }
    
    var counter: Int = 0{
        willSet(newTotal){
            print("计数器: \(newTotal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
}

struct StructDemo {
    static var storedTypeProperty = "StructDemo"
    static var computedTypeProperty: Int {
       // 这里返回一个 Int 值
        return 3
    }
}

enum EnumDemo {
    static var storedTypeProperty = "Enumname"
    static var computedTypeProperty: Int {
       // 这里返回一个 Int 值
        return 5
    }
}

class ClassDemo {
    static var storedTypeProperty = "ClassDemo"
    class var computedTypeProperty: Int {
       // 这里返回一个 Int 值
        return 6
    }
}

class TestPropertyDemo {
    func testMain() {
        testStorageProperty()
        testComputeProperty()
        testObserver()
        testGloable()
        testClassProperty()
    }
    
    func testStorageProperty() {
        var n = Number(digits: 12345)
        n.digits = 67
        print("\(n.digits)")
        print("\(n.pi)")
    }
    
    func testComputeProperty() {
        let result = sample()
        print(result.middle)
        result.middle = (0.0, 10.0)

        print(result.no1)
        print(result.no2)
        
        print(result.origin)
    }
    
    func testObserver () {
        let NewCounter = sample()
        NewCounter.counter = 100
        NewCounter.counter = 800
    }
    
    func testGloable () {
        print(globleString)
    }
    
    func testClassProperty() {
        print(StructDemo.storedTypeProperty)
        print(StructDemo.computedTypeProperty)
        print(EnumDemo.storedTypeProperty)
        print(EnumDemo.computedTypeProperty)
        print(ClassDemo.storedTypeProperty)
        print(ClassDemo.computedTypeProperty)
    }
    
}
