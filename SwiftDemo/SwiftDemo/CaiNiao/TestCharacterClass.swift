//
//  TestCharacterClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/19.
//

import Foundation

class TestCharacterClass {
    func testMain() {
        let char1:Character = "A"
        print("char1 的值为 \(char1)")
        testEmpty()
        testFor()
        testAppend()
    }
    
    func testEmpty() {
        // Swift 中以下赋值会报错
//        let char1: Character = ""
//        var char2: Character = ""

        let char1:Character = " "
        var char2:Character = " "
        print("char1 的值为 \(char1)")
        print("char2 的值为 \(char2)")
    }
    
    func testFor() {
        for ch in "Runoob" {
            print("ch in Runoob:\(ch)")
        }
    }
    
    func testAppend(){
        var varA:String = "Hello "
        let varB:Character = "G"

        varA.append( varB )
        print("varC  =  \(varA)")
    }
}
