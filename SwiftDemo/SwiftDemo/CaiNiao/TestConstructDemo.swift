//
//  TestConstructDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/15.
//

import Foundation
class TestConstructDemo {
    func testMain() {
        testInit();
        testInherit();
    }
    
    func testInit() {
        struct rectangle {
            var length: Double
            var breadth: Double
            init() {
                length = 6
                breadth = 12
            }
        }
        var area = rectangle()
        print("矩形面积为 \(area.length*area.breadth)")
    }
    
    func testDefault() {
        struct rectangle {
            // 设置默认值
            var length = 6
            var breadth = 12
        }
        var area = rectangle()
        print("矩形的面积为 \(area.length*area.breadth)")
    }
    
    func testInitParam() {
        struct Rectangle {
            var length: Double
            var breadth: Double
            var area: Double
            
            init(fromLength length: Double, fromBreadth breadth: Double) {
                self.length = length
                self.breadth = breadth
                area = length * breadth
            }
            
            init(fromLeng leng: Double, fromBread bread: Double) {
                self.length = leng
                self.breadth = bread
                area = leng * bread
            }
        }

        let ar = Rectangle(fromLength: 6, fromBreadth: 12)
        print("面积为: \(ar.area)")

        let are = Rectangle(fromLeng: 36, fromBread: 12)
        print("面积为: \(are.area)")
    }
    
    func testChangeLet () {
        struct Rectangle {
            let length: Double?
            
            init(frombreadth breadth: Double) {
                length = breadth * 10
            }
            
            init(frombre bre: Double) {
                length = bre * 30
            }
            
            init(_ area: Double) {
                length = area
            }
        }

        let rectarea = Rectangle(180.0)
        print("面积为：\(rectarea.length)")

        let rearea = Rectangle(370.0)
        print("面积为：\(rearea.length)")

        let recarea = Rectangle(110.0)
        print("面积为：\(recarea.length)")
    }
    
    func testDefaultInit () {
        class ShoppingListItem {
            var name: String?
            var quantity = 1
            var purchased = false
        }
        var item = ShoppingListItem()


        print("名字为: \(item.name)")
        print("数理为: \(item.quantity)")
        print("是否付款: \(item.purchased)")
    }
    
    func testEveryInit() {
        struct Rectangle {
            var length = 100.0, breadth = 200.0
        }
        let area = Rectangle(length: 24.0, breadth: 32.0)

        print("矩形的面积: \(area.length)")
        print("矩形的面积: \(area.breadth)")
    }
    
    func testInherit () {
        class MainClass {
            var name: String
            
            init(name: String) {
                self.name = name
            }
            
            convenience init() {
                self.init(name: "[匿名]")
            }
        }
        let main = MainClass(name: "Runoob")
        print("MainClass 名字为: \(main.name)")

        let main2 = MainClass()
        print("没有对应名字: \(main2.name)")

        class SubClass: MainClass {
            var count: Int
            init(name: String, count: Int) {
                self.count = count
                super.init(name: name)
            }
            
            override convenience init(name: String) {
                self.init(name: name, count: 1)
            }
        }

        let sub = SubClass(name: "Runoob")
        print("MainClass 名字为: \(sub.name)")

        let sub2 = SubClass(name: "Runoob", count: 3)
        print("count 变量: \(sub2.count)")
    }
    
}
