//
//  TestArrayClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/21.
//

import Foundation

class TestArrayClass {
    func testArray() {
        testArrayCeate()
        testItem()
        testModify()
        testForIn()
        testMerge()
        testCount()
        testEmpty()
    }
    
    func testArrayCeate() {
        var someArray = [Any]()
        print("someArray1:\(someArray)")
        someArray = [Any](repeating: 0, count: 5)
        print("someArray2:\(someArray)")
        
        var someInts = [Int](repeating: 0, count: 3)
        print("someInts:\(someInts)")
        someInts = [10,20,30]
        print("someInts:\(someInts)")
        
        var someInts1:[Int] = [10,20,30]
        print("someInts1:\(someInts1)")
    }
    
    func testItem() {
        var someInts = [Int](repeating: 10, count: 3)
        var someVar = someInts[0]
        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[1])" )
        print( "第三个元素的值 \(someInts[2])" )
    }
    
    func testModify() {
        var someInts = [Int]()
        someInts.append(contentsOf: 0...1)
        someInts.append(20)
        someInts.append(30)
        someInts += [40]
        someInts[2] = 50
        
        let someVar = someInts[2]
        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[3])" )
        print( "第三个元素的值 \(someInts[4])" )
    }
    
    func testForIn() {
        var someStrs = [String]()
        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]
        
        for item in someStrs {
            print(item)
        }
        
        for (index,item) in someStrs.enumerated() {
            print("index is \(index),item is \(item)")
        }
    }
    
    func testMerge(){
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)

        var intsC = intsA + intsB

        for item in intsC {
            print(item)
        }
    }
    
    func testCount(){
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        print("intsA count is \(intsA.count)")
        print("intsA count is \(intsB.count)")
        print("intsA count is \(intsC.count)")
    }
    
    func testEmpty(){
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        var intsC = [Int]()
        print("intsA isEmpty \(intsA.isEmpty)")
        print("intsA isEmpty \(intsB.isEmpty)")
        print("intsA isEmpty \(intsC.isEmpty)")
    }
}
