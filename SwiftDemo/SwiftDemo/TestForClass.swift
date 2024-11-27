//
//  TestForClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/21.
//

import Foundation

class TestForClass {
    
    func testFor(){
        testForIn();
        testForWhile();
        testForRepeat();
    }
    
    func testForIn() {
        for index in 1...5 {
            print("\(index) 乘于 5 为：\(index * 5)")
        }
        
        var someInts:[Int] = [10, 20, 30]
        for index in 0..<someInts.count {
            print( "索引 [\(index)] 对应的值为 \(someInts[index])")
        }
    }
    
    func testForWhile() {
        var index = 10
        while index < 20
        {
           print( "index 的值为 \(index)")
           index = index + 1
        }
    }
    
    func testForRepeat() -> Int {
        var index = 15

        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
        
        return 0
    }
}
