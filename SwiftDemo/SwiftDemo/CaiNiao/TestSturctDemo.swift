//
//  TestSturctDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/19.
//

import Foundation

struct BaseStruct {
    let name:String;
    init(name:String) {
        self.name = name;
    }
}

//struct 不支持继承
//struct SomePoint:BaseStruct {
//    let someInt:Int;
//    init(someInt:Int) {
//        self.someInt = someInt
//        super.init(name:"Point");
//    }
//}

class TestStructDemo {

    func testCreate() {
        struct MarkStruct {
            var mark1:Int
            var mark2:Int
            let mark3:Int
            
            // 当初始化函数与默认初始化函数相同时可以省略
            init(mark1:Int,mark2:Int,mark3:Int) {
                self.mark1 = mark1
                self.mark2 = mark2
                self.mark3 = mark3
            }
            
            //初始化函数的代理
            init() {
                self.init(mark1: 100,mark2: 100,mark3: 90)
            }
        }
        
        print("优异成绩:")
        let marks = MarkStruct(mark1: 98, mark2: 96, mark3:100)
        print(marks.mark1)
        print(marks.mark2)
        print(marks.mark3)
        
        print("糟糕成绩:")
        let fail = MarkStruct(mark1: 34, mark2: 42, mark3: 13)
        print(fail.mark1)
        print(fail.mark2)
        print(fail.mark3)
    }
}
