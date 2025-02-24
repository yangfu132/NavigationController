//
//  TestFunctionDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/12.
//

import Foundation

struct area {
    var length = 1
    var breadth = 1
    func area() -> Int {
        return length * breadth
    }
    
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        
        print(length)
        print(breadth)
    }
    
    mutating func scaleDemo(scale:Int) {
        length *= scale;
        breadth *= scale;
        
        print(length)
        print(breadth)
    }
}

class TestFunctionDemo {
    let aaa = "aaa";
    func testMain() {
        testFunc();
        TestFunctionDemo.testClassFunc();
    }
    
    //Swift 默认仅给方法的第一个参数名称一个局部参数名称;默认同时给第二个和后续的参数名称为全局参数名称。
    // 没看出来啊，貌似没区别，应该都是全局名称吧。
    func testFuncDemoBy(no1:Int, no2:Int) {
        print(self.aaa)
    }
    
    func testFuncDemoBy(first no1:Int, no2:Int) {
        
    }
    
    func testFunc(){
        testFuncDemoBy(no1:1, no2:2);
        testFuncDemoBy(first: 1, no2: 2);
    }
    
    class func testClassFunc() {
        print("class func")
    }
    
    
}
