//
//  TestExtensionDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/14.
//

import Foundation

extension Int {
    var add: Int {return self + 100}
    var sub: Int {return  self - 100}
    var mul: Int {return self * 100}
    var div: Int {return self / 5}
}

struct sum  {
    var num1 = 100, num2 = 200
}

struct diff {
    var no1 = 200, no2 = 100
}

struct mult  {
    var a = sum()
    var b = diff()
}

extension mult {
    init (x:sum, y:diff) {
        _ = x.num1 + x.num2
        _ = y.no1 + y.no2
    }
}

extension Int {
    func topics(summation:() -> ()) {
        for _ in 0..<self {
            summation()
        }
    }
}

extension Double {
    mutating func square() {
        let pi = 3.1415
        self = pi * self * self
    }
}

extension Int {
    subscript(multtable:Int) -> Int {
        var powerOf10 = 1
        var index = multtable
        while index > 0 {
            powerOf10 *= 10
            index -= 1
        }
        return (self / powerOf10) % 10
    }
}

extension Int {
    enum calc
    {
       case add
       case sub
       case mult
       case div
       case anything
    }
    var print: calc {
       switch self
       {
          case 0:
             return .add
          case 1:
             return .sub
          case 2:
             return .mult
          case 3:
             return .div
          default:
             return .anything
        }
    }
}

class TestExtensionDemo {
    func testMain() {
        testComputeVar()
        testInit()
        testFunc()
        testMutating()
        testSubscript()
        testNestedTypes()
        testOC()
    }
    
    func testOC() {
        let ocDemo = TestExtensionCategoryOC()
        ocDemo.testMain()
    }
    
    func testComputeVar() {
        let addition = 3.add
        print("加法运算后的值：\(addition)")
        
        let subtraction = 120.sub
        print("减法运算后的值：\(subtraction)")
        
        let multiplication = 39.mul
        print("乘法运算后的值：\(multiplication)")
        
        let division = 55.div
        print("除法运算后的值: \(division)")
        
        let mix = 30.add + 34.sub
        print("混合运算结果：\(mix)")
        
    }
    
    func testInit() {
        let a = sum(num1: 100, num2: 200)
        let b = diff(no1: 200, no2: 100)
        
        let getMult = mult(x:a,y:b)
        print("getMult sum(\(getMult.a.num1), \(getMult.a.num2))")
        print("getMult diff(\(getMult.b.no1), \(getMult.b.no2))")
    }
    
    func testFunc() {
        4.topics {
            print("扩展模块内")
        }
        
        3.topics {
           print("内型转换模块内")
        }
    }
    
    func testMutating() {
        var trial1 = 3.3
        trial1.square()
        print("圆的面积为: \(trial1)")
        
        var Trial2 = 10.0
        Trial2.square()
        print("圆的面积为: \(Trial2)")


        var Trial3 = 120.3
        Trial3.square()
        print("圆的面积为: \(Trial3)")
    }
    
    func testSubscript() {
        print(12[0])     // 输出：2
        print(7869[1])   // 输出：6
        print(786543[2]) // 输出：5
    }
    
    func result(_ numb: [Int]) {
       for i in numb {
          switch i.print {
             case .add:
                print(" 10 ")
              case .sub:
                print(" 20 ")
             case .mult:
             print(" 30 ")
             case .div:
             print(" 40 ")
             default:
             print(" 50 ")

          }
       }
    }
    
    func testNestedTypes() {
        result([0, 1, 2, 3, 4, 7])
    }
    
}
