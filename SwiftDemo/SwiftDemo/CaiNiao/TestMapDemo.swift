//
//  TestMapDemo.swift
//  SwiftDemo
//
//  Created by yangfl on 2025/3/3.
//

import Foundation

enum TMEnumDemo {
    case frist,second,three
}

struct TMStructDemo {
    var name:String
    var age:Int
}

struct TMHashStructDemo:Hashable {
    var name:String
    var age:Int
}

class TestMapDemo {
    func testMain () {
        testString()
        testArray()
        testDictionary()
        testSet()
    }
    
    func testString() {
        let str = "123456"
        let someArray = str.map { c in
            String(c) + "\r\n"
        }
        print(someArray)
    }
    
    func testArray() {
        let values = [1.0,2,3,4,5,6,7]
        var squares:[Double] = []

        for value in values {
            squares.append(value * value)
        }
        
        print(squares)
        
        let mapSquares = values.map { value in
            value * value
        }
        print(mapSquares)
        
        let someArray = values.map { (value:Double) -> [Double] in
            [value]
        }
        print(someArray)
        
        let structValues:Array<TMStructDemo> = [TMStructDemo(name: "0", age: 0),
                            TMStructDemo(name: "0", age: 0),
                            TMStructDemo(name: "0", age: 0)]
        let someEnumrated = structValues.enumerated().map {(index, element) in
            var newElement = element
            newElement.age = index
            newElement.name = String(index)
            return newElement
        }
        print(someEnumrated)
        
        let revolsedEnumrated = structValues.enumerated().reversed().map { (index, element) in
            var newElement = element
            newElement.age = index
            newElement.name = String(index)
            return newElement
        }
        print(revolsedEnumrated)
        
//
//        let numbers = [7, 8, 9, 10]
//        let indexAndNum: [String] = numbers.enumerate().map { (index, element) in
//            return "\(index): \(element)"
//        }
//        let actualIndexAndNum: [String] = zip(numbers.indices, numbers).map {
//            "\($0): \($1)"
//         }
//        print(actualIndexAndNum)// ["0: 7", "1: 8", "2: 9", "3: 10"]
//        print(indexAndNum)// ["0: 7", "1: 8", "2: 9", "3: 10"]
    }
    
    func testDictionary() {
        let dict = ["a":1.0,"b":2.0]
        let some = dict.map { (key: String, value: Double) in
            key + String(value)
        }
        
        print(some)
    }
    
    func testSet () {
        let structValues:Set<TMHashStructDemo> = [TMHashStructDemo(name: "0", age: 0),
                                                  TMHashStructDemo(name: "0", age: 0),
                                                  TMHashStructDemo(name: "0", age: 0)]
        
        
        var intValues:Set = [1,2,3]
        let (inserted,memberAfterInsert) = intValues.insert(2)
        print("result:\(inserted),value:\(memberAfterInsert)")
        
         let (result,value) = intValues.insert(4)
        print("result:\(result),value:\(value)")
    }
}
