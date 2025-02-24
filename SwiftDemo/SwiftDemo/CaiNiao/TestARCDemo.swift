//
//  Test.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/18.
//

import Foundation

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) 开始初始化")
    }
    deinit {
        print("\(name) 被析构")
    }
}

class TestARCDemo {
    func testMain() {
        testARC()
    }
    
    func testARC() {
        var reference1:Person?
        var reference2:Person?
        var reference3:Person?
        
        reference1 = Person(name: "Runoob")
        reference2 = reference1
        reference3 = reference2
        
        reference1 = nil
        reference2 = nil
        reference3 = nil
    }
    
    func testClass() {
        ///对于生命周期中会变为nil的实例使用弱引用。
        ///相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。
        testWeak();
        testUnOwned();
    }
    
    func testWeak() {
        class Module {
            let name:String
            init(name:String) {
                self.name = name
            }
            var sub: SubModule?
        }
        
        class SubModule{
            let number:Int
            init(number:Int) {
                self.number = number
            }
            
            weak var topic:Module?
            
            deinit {print("子模块 topic 数为 \(number)")}
        }
        
        var toc:Module?
        var list:SubModule?
        toc = Module(name: "ARC")
        list = SubModule(number: 4)
        toc!.sub = list
        list!.topic = toc
        
        toc = nil
        list = nil
        
    }
    
    
    func testUnOwned() {
        class Module {
            let name:String
            init(name:String) {
                self.name = name
            }
            var sub: SubModule?
        }
        
        class SubModule{
            let number:Int
            init(number:Int) {
                self.number = number
            }
            
            unowned var topic:Module?
            
            deinit {print("子模块 topic 数为 \(number)")}
        }
        
        var toc:Module?
        var list:SubModule?
        toc = Module(name: "ARC")
        list = SubModule(number: 4)
        toc!.sub = list
        list!.topic = toc
        
        toc = nil
        list = nil
    }
    
    func testBlock() {
//        相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。
//        如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
//        当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。
        self.testUnownedBlock();
    }
    
    func testUnownedBlock() {
        class HTMLElement {
            
            let name: String
            let text: String?
            
            lazy var asHTMLRetain:()->String = {
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            lazy var asHTMLUnowned: () -> String = {
                [unowned self] in
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                 self.name = name
                 self.text = text
             }
            
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        // 创建实例并打印信息
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTMLUnowned())
    }
}
