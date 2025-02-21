//
//  TestGenericsDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/20.
//

import Foundation

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct GenericsStack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

extension GenericsStack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

// Container 协议
protocol TGAContainer {
    associatedtype ItemType
    
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
    
    // 获取容器中元素的数
    var count: Int { get }
    
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType { get }
}

struct TGAssociatedStack<Element>: TGAContainer {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

class TestGenericsDemo {
    func testMain() {
        testFunction()
        testStack()
    }
    
    func testFunction() {
        var numb1 = 100
        var numb2 = 200
        
        print("交换前数据: \(numb1) 和 \(numb2)")
        swapTwoInts(&numb1, &numb2)
        print("交换前数据: \(numb1) 和 \(numb2)")
        
        print("交换前数据: \(numb1) 和 \(numb2)")
        swapTowValues(&numb1, &numb2)
        print("交换前数据: \(numb1) 和 \(numb2)")
        
        
        var str1 = "str1"
        var str2 = "str2"
        print("交换前数据: \(str1) 和 \(str2)")
        swapTowValues(&str1, &str2)
        print("交换前数据: \(str1) 和 \(str2)")
        
        var dou1 = 1.0
        var dou2 = 2.0
        print("交换前数据: \(dou1) 和 \(dou2)")
        swapTowValues(&dou1, &dou2)
        print("交换前数据: \(dou1) 和 \(dou2)")
    }
    
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTowValues<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    func testStack() {
        var stackOfStrings = GenericsStack<String>()
        print("字符串元素入栈: ")
        stackOfStrings.push("google")
        stackOfStrings.push("runoob")
        print(stackOfStrings.items)
        
        let deletetos = stackOfStrings.pop()
        print("出栈元素: " + deletetos)
        
        var stackOfInts = GenericsStack<Int>()
        print("整数元素入栈: ")
        stackOfInts.push(1)
        stackOfInts.push(2)
        print(stackOfInts.items);
        
    }

    func testExtension() {
        var stackOfStrings = GenericsStack<String>()
        print("字符串元素入栈: ")
        stackOfStrings.push("google")
        stackOfStrings.push("runoob")
        
        if let item = stackOfStrings.topItem {
            print("栈中的顶部元素是：\(item).")
        }
        print(stackOfStrings.items)
    }
 
    func findIndex(ofString valueToFind:String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        
        return nil
    }
    
    func testTypeConstraints() {
        let strings = ["google", "weibo", "taobao", "runoob", "facebook"]
        if let foundIndex = findIndex(ofString: "runoob", in: strings) {
            print("runoob 的索引为 \(foundIndex)")
        }
    }
    
    func testAssociatedType() {
        var tos = TGAssociatedStack<String>()
        tos.push("google")
        tos.push("runoob")
        tos.push("taobao")
        // 元素列表
        print(tos.items)
        // 元素个数
        print( tos.count)
    }

    func allItemsMatch<C1:TGAContainer, C2:TGAContainer>(_ someContainer: C1, _ anotherContainer:C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType:Equatable  {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
    }
    
    func testWhere() {
        
        var tos = TGAssociatedStack<String>()
        tos.push("google")
        tos.push("runoob")
        tos.push("taobao")
        
        let aos = ["google", "runoob", "taobao"]
        
        if allItemsMatch(tos, aos) {
            print("匹配所有元素")
        } else {
            print("元素不匹配")
        }
    }
}

extension Array: TGAContainer {}



