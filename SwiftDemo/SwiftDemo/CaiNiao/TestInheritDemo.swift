//
//  TestInheritDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/13.
//

import Foundation



class TestInheritDemo {
    func testMain() {
        testInherit();
        testOverrideFunc();
        testOverrideProperty();
        testNoOverride();
    }
    
    func testInherit() {
        class StudDetails
        {
            var mark1: Int;
            var mark2: Int;
            
            init(stm1:Int, results stm2:Int)
            {
                mark1 = stm1;
                mark2 = stm2;
            }
            
            func show()
            {
                print("Mark1:\(self.mark1), Mark2:\(self.mark2)")
            }
        }

        class Tom : StudDetails
        {
            init()
            {
                super.init(stm1: 93, results: 89)
            }
        }
        
        let tom = Tom()
        tom.show()
    }
    
    func testOverrideFunc() {
        class SuperClass {
            func show() {
                print("这是超类 SuperClass")
            }
        }

        class SubClass: SuperClass  {
            override func show() {
                print("这是子类 SubClass")
            }
        }

        let superClass = SuperClass()
        superClass.show()

        let subClass = SubClass()
        subClass.show()
    }
    
    func testOverrideProperty() {
        class Circle {
            var radius = 12.5
            var area: String {
                return "矩形半径 \(radius) "
            }
        }
        
        ///重写属性
        // 继承超类 Circle
        class Rectangle: Circle {
            var print = 7
            override var area: String {
                return super.area + " ，但现在被重写为 \(print)"
            }
        }

        let rect = Rectangle()
        rect.radius = 25.0
        rect.print = 3
        print("Radius \(rect.area)")
        
        ///重写属性观察器
        class Square: Rectangle {
            override var radius: Double {
                didSet {
                    print = Int(radius/5.0)+1
                }
            }
        }
        
        let sq = Square()
        sq.radius = 100.0
        print("半径: \(sq.area)")
    }
    
    func testNoOverride() {
        final class Circle {
            final var radius = 12.5
            var area: String {
                return "矩形半径为 \(radius) "
            }
        }
    }
}
