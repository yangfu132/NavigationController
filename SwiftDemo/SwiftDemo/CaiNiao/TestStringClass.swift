//
//  TestClass.swift
//  SwiftDemo
//
//  Created by FuYou on 2024/11/15.
//

import Foundation

class TestStringClass {
    func testString() -> String {
        testCreate(x:"")
        testEmpty(x:"x",y:"y")
        testLet()
        return "testString";

    }
    
    func testCreate(x:Any) {
        var stringA = "Hello, World!"
        print(stringA)
        
        var stringB = String("Hello, World!");
        print(stringB)
    }
    
    func testEmpty(x:Any, y:Any) -> String {
        var stringA = ""
        if stringA.isEmpty {
            print("stringA is empty")
        } else {
            print("stringA is not empty")
        }
        
        let stringB = String()
        
        if stringB.isEmpty {
            print("stringB is empty")
        } else {
            print("stringB is not empty")
        }
        return ""
    }
    
    func testLet () -> String {
        var stringA = "菜鸟教程:"
        stringA += "http://www.runoob.com"
        print(stringA)
        
        let stringB = "菜鸟教程:"
//        stringB += "http://www.runoob.com"
        return stringA + stringB
        
    }
    
    func testInsert () {
        var varA   = 20
        let constA = 100
        var varC:Float = 20.0

        var stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
        print( stringA )
    }
    
    func testAppend(){
        let constA = "菜鸟教程："
        let constB = "http://www.runoob.com"

        var stringA = constA + constB

        print( stringA )
    }
     
    func testCount() {
        var varA   = "www.runoob.com"

        print( "\(varA), 长度为 \(varA.count)" )
    }
    
    func testCompare() {
        var varA = "Hello,Swift"
        var varB = "Hello,World"
        if varA == varB {
            print( "\(varA) 与 \(varB) 是相等的" )
        } else {
            print( "\(varA) 与 \(varB) 是不相等的" )
        }
    }
    
    func testUnicode() {
        
        var unicodeString = "菜鸟教程"
        print("UTF-8 编码：")
        for code in unicodeString.utf8 {
            print("\(code)")
        }
        
        print("\n")
        
        print("UTF-16 编码: ")
        
        for code in unicodeString.utf16 {
            print("\(code)")
        }
        
        let flowers = "Flowers 💐"
        for v in flowers.unicodeScalars {
            print(v.value)
        }
    }
    
}
