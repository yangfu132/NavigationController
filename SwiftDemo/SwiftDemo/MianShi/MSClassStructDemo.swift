//
//  MSClassStructDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/21.
//

import Foundation
class Animal {
    var name: String?
    var weight = 0.0
}

extension Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name && lhs.weight == rhs.weight
    }
}

struct FPoint {
    var x = 0.0
    var y = 0.0
    //当在struct修改属性的时候需要使用mutating
    mutating func addX(add: Double) {
        self.x = self.x + add
    }
}

protocol SomeProtocol {
    // 这里可以定义协议要求
    var someProperty: Int { get set }
    func someMethod()
}

struct SomeStructure: SomeProtocol {
    var someProperty: Int
    func someMethod() {
    }
}

class MSClassStructDemo {
    var point = FPoint(x: 1, y: 1);

    func testMain() {
        point.x = 2;
        
        testClass()
        testStruct()
        testRetainCount()
        testType()
        
    }
    
    func testType () {
        let demo = SomeStructure(someProperty:9)
        if (demo is SomeProtocol) {
            print("SomeProtocol");
        } else {
            print("SomeProtocol");
        }
    }
    
    func testRetainCount() {
        class MyClass {
            deinit {
                
            }
        }

        struct MyStruct {
            var myClass: MyClass
//            deinit {
//
//            }
        }

        let o = MyClass()
        print("count\(CFGetRetainCount(o))")
        let s1 = MyStruct(myClass: o)
        print("count\(CFGetRetainCount(o))")
        let s2 = s1
        print("count\(CFGetRetainCount(o))")
        print("count")
    }
    
    func testClass() {

        
        let cat1 = Animal()
        cat1.name = "cat1"
        cat1.weight = 10
        
        
        let cat2 = Animal()
        cat2.name = "cat2"
        cat2.weight = 20
        
        var tempcat = cat1
        print("cat's name: \(tempcat.name!), cat's weight: \(tempcat.weight)")
        
        tempcat = cat2
        print("cat's name: \(tempcat.name!), cat's weight: \(tempcat.weight)")
        
        let blackCat1 = cat1
        blackCat1.name = "catName"
        blackCat1.weight = 10
        
        let blackCat2 = cat2
        blackCat2.name = "catName"
        blackCat2.weight = 10
        
        if blackCat1 === cat1 {
            print("Identical") //Identical
        } else {
            print("Not identical")
        }
        
        if cat2 === blackCat1 {
            print("Identical")
        } else {
            print("Not identical") //Not identical
        }
        
        if cat2 == blackCat1 {
            print("Equal")
        } else {
            print("Not Equal") //Equal
        }
    }
    
    func testStruct() {


        let p1 = FPoint()
        print("p1's x : \(p1.x), p1's y: \(p1.y)") // p1's x : 0.0, p1's y: 0.0

        var p2 = p1
        p2.x = 3.0
        print("p1's x : \(p1.x), p1's y: \(p1.y); p2's x : \(p2.x), p2's y: \(p2.y)")
        //p1's x : 1.0, p1's y: 2.0; p2's x : 3.0, p2's y: 2.0
    }
}
