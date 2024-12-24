//
//  TestClassDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/24.
//

import Foundation

class TestClassDemo {
    func testClass () {
        testEqual()
    }
    
    class SampleClass:Equatable {
        let myProperty: String
        init(s:String) {
            myProperty = s
        }
        
        static func == (lhs:SampleClass, rhs:SampleClass )->Bool {
            return lhs.myProperty == rhs.myProperty
        }
    }

    func testEqual() {
        let spClass1 = SampleClass(s: "Hello")
        let spClass2 = SampleClass(s: "Hello")
        if (spClass1 == spClass2) {
            print("相等\(spClass1.myProperty)")
        }
        
        if spClass1 === spClass2 {
            print("引用相同的类实例 \(spClass1)")
        }
        
        if spClass1 !== spClass2 {
            print("引用不相同的类实例 \(spClass2)")
        }
    }
}


