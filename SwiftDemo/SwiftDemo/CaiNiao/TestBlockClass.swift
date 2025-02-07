//
//  TestBlockClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/27.
//

import Foundation

@objcMembers class TestBlockClass : NSObject {
    
    func testBlock() {
        testClosures()
        testSort()
        testTakesAClosure()
        testCapture()
        testReference()
    }
    
    func testClosures () {
        let studname = {print("Swift 闭包实例。")}
        studname()
        
        let divide = {(val1:Int, val2:Int) -> Int in
            return val1 / val2
        }
        let result = divide(200,20)
        print(result)
    }
    
    func testSort() {
        let names = ["AT","AE","D","S","BE"]
        
        //sort方法
        func backwards(s1:String, s2:String) -> Bool {
            return s1 > s2
        }
        
        var reversed = names.sorted(by: backwards)
        print(reversed)
        
        //参数名称缩写
        reversed = names.sorted(by: {$0 < $1})
        print(reversed)
        
        //运算符函数
        reversed = names.sorted(by: >)
        print(reversed)
        
    }

    
    func testTakesAClosure(){
        
        func someFunctionThatTakesAClosure(closure:() -> Void) {
            print("func")
            closure()
        }
        
        someFunctionThatTakesAClosure(closure: {
            print("closure")
        })
        
        someFunctionThatTakesAClosure() {
            print("closure")
        }
        
        let names = ["AT", "AE", "D", "S", "BE"]
        var reversed = names.sorted() {
            $0 > $1
        }
        print("reversed: \(reversed)")
        
        //注意： 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。
        reversed = names.sorted {
            $1 > $0
        }
        print("reversed: \(reversed)")
    }
    
    func testCapture () {
        func makeIncrementor(forIncrement amount:Int) -> () -> Int {
                
            var runningTotal = 0
            func incrementor() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        
        let incrementByTen = makeIncrementor(forIncrement: 10)
        print(incrementByTen())
        print(incrementByTen())
        print(incrementByTen())
    }
    
    func testReference() {
        func makeIncrementor(forIncrement amount:Int) -> () -> Int {
                
            var runningTotal = 0
            func incrementor() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        
        let incrementByTen = makeIncrementor(forIncrement: 10)
        incrementByTen()
        
        incrementByTen()
        
        incrementByTen()
        
        let alsoIncrementByTen = incrementByTen
        print(alsoIncrementByTen)
    }
    
}
