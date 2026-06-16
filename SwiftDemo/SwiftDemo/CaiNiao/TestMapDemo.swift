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
        let some = str.reduce("o", {(someString, c) -> String in
            someString + String(c)
        })
        print(some)
        
        let mapArray = str.map { c in
            String(c) + "\r\n"
        }
        print(mapArray)
        
        let filterArray = str.filter { c in
            (Int(String(c)) ?? 0)%2 == 0
        }
        print(filterArray)
    }
    
    func testArray() {
        let values = [1.0,2,3,4,5,6,7]
        let someDouble = values.reduce(10) { partialResult, value in
            partialResult + value
        }
        print(someDouble)
        
        let someString = values.reduce("A") { partialResult, value in
            partialResult + String(value)
        }
        print(someString)
        
        let filterArray = values.filter { value in
            value > 5.0
        }
        print(filterArray)
        
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
        
        let collections = [[5, 2, 7], [4, 8], [9, 1, 3]]
        let flat = collections.flatMap { $0 }
        print(flat)
        // [5, 2, 7, 4, 8, 9, 1, 3]
        
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
        let flat = dict.compactMap { (key: String, value: Double) in
            key
        }
        print(flat)
        
        let mapArray = dict.map { (key: String, value: Double) in
            key + String(value)
        }
        print(mapArray)
        
        let filterDict = dict.filter{ (key: String, value: Double) in
            value > 1.0
        }
        print(filterDict)
        
//        let someV = dict.reduce("begin:") { partialResult, (key: String, value: Double) in
//            partialResult + key + String(value)
//        }
        
//        print(someV)
        
       
    }
    
    func testSet () {
        var structValues:Set<TMHashStructDemo> = [TMHashStructDemo(name: "0", age: 0),
                                                  TMHashStructDemo(name: "0", age: 0),
                                                  TMHashStructDemo(name: "0", age: 0)]
        
        var intValues:Set = [1,2,3]
        let (inserted,memberAfterInsert) = intValues.insert(2)
        print("result:\(inserted),value:\(memberAfterInsert)")
        
         let (result,value) = intValues.insert(4)
        print("result:\(result),value:\(value)")
        
        structValues.insert(TMHashStructDemo(name: "1", age: 1))
        let filterArray = structValues.filter { demo in
            demo.age > 0
        }
        print(filterArray)
    }
}
