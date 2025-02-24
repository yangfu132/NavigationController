//
//  TestDictionaryClass.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/25.
//

import Foundation

class TestDictionaryClass: NSObject {
    @objc func testDictionary () {
        testCreate()
        testValue()
        testModify()
        testRemove()
        testForIn()
        testTransform()
        testCount()
        testEmpty()
    }
    
    func testCreate() {
        print("++++++++++testCreate+++++++++")
        var firstDict = [String:Int]()
        firstDict["1"] = 1
        print(firstDict)
        
        var someDict = [Int: String]()
        someDict = [1:"One", 2:"Two", 3:"Three"]
        print(someDict)
    }
    
    func testValue() {
        print("++++++++++testValue+++++++++")
        let someDict = [1:"one",2:"Two",3:"Three"]
        let someVar = someDict[1]
        print("key = 1, value = \(someVar ?? "someVar")")
        print("key = 2, value = \(someDict[2] ?? "someDict[2]")")
        print("key = 3, value = \(someDict[3] ?? "someDict[3]")")
        
    }
    
    func testModify() {
        print("++++++++++testModify+++++++++")
        var someDict:[Int:String] = [1:"one",2:"two",3:"three"]
        var oldVal = someDict.updateValue("one new", forKey: 1)
        var someVar = someDict[1]
        print("1 key = 1 old, value = \(oldVal ?? "oldVal")")
        print("1 key = 1, value = \(someVar ?? "someVar")")
        print("1 key = 2, value = \(someDict[2] ?? "someDict[2]")")
        print("1 key = 3, value = \(someDict[3] ?? "someDict[3]")")
        
        someDict = [1:"one",2:"two",3:"three"]
        oldVal = someDict[1]
        someDict[1] = "one new"
        someVar = someDict[1]
        print("2 key = 1 old, value = \(oldVal ?? "oldVal")")
        print("2 key = 1, value = \(someVar ?? "someVar")")
        print("2 key = 2, value = \(someDict[2] ?? "someDict[2]")")
        print("2 key = 3, value = \(someDict[3] ?? "someDict[3]")")
    }
    
    func testRemove() {
        print("++++++++++testRemove+++++++++")
        var someDict:[Int:String] = [1:"one",2:"two",3:"three"]
        var removedValue = someDict.removeValue(forKey: 2)
        print("removedValue, value = \(removedValue)")
        print("1 key = 1, value = \(someDict[1] ?? "nil")")
        print("1 key = 2, value = \(someDict[2] ?? "nil")")
        print("1 key = 3, value = \(someDict[3] ?? "nil")")
        
        someDict = [1:"one",2:"two",3:"three"]
        someDict[2] = nil
        print("2 key = 1, value = \(someDict[1])")
        print("2 key = 2, value = \(someDict[2])")
        print("2 key = 3, value = \(someDict[3])")
    }
    
    func testForIn() {
        print("++++++++++testForIn+++++++++")
        var someDict:[Int:String] = [1:"one",2:"two",3:"three"]
        for (key,value ) in someDict {
            print("someDict: key = \(key), value = \(value)")
        }
        
        for (key,value) in someDict.enumerated() {
            print("someDict.enumerated: key = \(key), value = \(value)")
        }
    }
    
    func testTransform() {
        print("++++++++++testTransform+++++++++")
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        let dictKeys = someDict.keys
        let dictValues = someDict.values

        print("输出字典的键(dictKeys)")
        for key in dictKeys {
            print("\(key)")
        }
        
        print("输出字典的值(dictValues)")
        for value in dictValues {
            print("\(value)")
        }
        
        let keys = [Int](someDict.keys)
        let values = [String](someDict.values)
        print("输出字典的键(keys)")
        for key in keys {
            print("\(key)")
        }
        
        print("输出字典的值(values)")
        for value in values {
            print("\(value)")
        }
    }
    
    func testCount() {
        print("++++++++++testCount+++++++++")
        var someDict1:[Int:String] = [1:"one",2:"two",3:"three"]
        var someDict2:[Int:String] = [4:"four",5:"five"]
        print("someDict1, count:\(someDict1.count)")
        print("someDict2, count:\(someDict2.count)")
    }
    
    func testEmpty() {
        print("++++++++++testEmpty+++++++++")
        var someDict1:[Int:String] = [1:"one",2:"two",3:"three"]
        var someDict2:[Int:String] = [4:"four",5:"five"]
        var someDict3:[Int:String] = [Int:String]()
        print("someDict1, isEmpty:\(someDict1.isEmpty)")
        print("someDict2, isEmpty:\(someDict2.isEmpty)")
        print("someDict3, isEmpty:\(someDict3.isEmpty)")
    }
    
    func testFilter () {
        let someDict1:[Int:String] = [1:"one",2:"two",3:"three"]
        let filteredDict = someDict1.filter { key, val in
            return key >= 2
        }
        print(filteredDict)
    }
    
    func testPlus () {
        var dictionary = ["a": 1, "b": 2]
        
        // Keeping existing value for key "a":
        dictionary.merge(zip(["a", "c"], [3, 4])) { (current, _) in current }
        // ["b": 2, "a": 1, "c": 4]

        // Taking the new value for key "a":
        dictionary.merge(zip(["a", "d"], [5, 6])) { (_, new) in new }
        // ["b": 2, "a": 5, "c": 4, "d": 6]
        
//        没有找到相减
    }
}
    
