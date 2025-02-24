//
//  SDRuntimeDemo.swift
//  SwiftDemo
//
//  Created by FuYou on 2025/2/24.
//

import Foundation
import UIKit

/**
 *https://juejin.cn/post/6997976106288545822*
 *错误：说明Swfit中只能替换系统方法，而自定义的方法之间无法进行替换
 *https://zeroonet.com/2024/04/15/objc-vs-dynamic/
 *正确：你需要objc和dynamic同时修饰
 */
//MARK: - 纯SwiftClass

class PureSwiftClass {
//    @objc var bolValue: Bool = false
//    @objc var age: Int = 0
//    @objc var height: Float = 0
//    @objc var name: String?
    @objc var exName: String?
    
    func testDefault() {
        print("PureSwiftClass.testDefault")
    }
    
    @objc func testObjc() {
        print("PureSwiftClass.testObjc")
    }
    
    @objc final func testObjcFinal() {
        print("PureSwiftClass.testObjcFinal")
    }
    
    @objc dynamic func testPureAction() {
        print("PureSwiftClass.testPureAction")
    }
}
extension PureSwiftClass {
    @objc func swizzle_testPureAction() {
        print("swizzle_testPureAction")
    }
}

extension PureSwiftClass: SelfAware {
    func testSwizzling() {
        let originalSelector = #selector(testPureAction)
        let swizzledSelector = #selector(swizzle_testPureAction)
        swizzlingForClass(PureSwiftClass.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
}

//MARK: - MuixSwiftClass

class MuixSwiftClass: UIViewController {

//    @objc var bolValue: Bool = false
//    @objc var age: Int = 0
//    @objc var height: Float = 0
//    @objc var name: String?
    @objc var exName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//
//    @objc func createSubView(view : UIView) {
//        print("MuixSwiftClass.createSubView")
//    }
    
    func testDefalut() {
        print("MuixSwiftClass.testDefalut")
    }
    
    dynamic func testDynamic() {
        print("MuixSwiftClass.testDynamic")
    }
    
    @objc final func testObjcFinal() {
        print("MuixSwiftClass.testObjcFinal")
    }
    
    @objc func testObjc() {
        print("MuixSwiftClass.testObjc")
    }
    
    @objc dynamic func testObjcDynamic() {
        print("MuixSwiftClass.testObjcDynamic")
    }
    

    @objc dynamic func testObject(boolValue : Bool , tempInt : Int , tempFloat : Float , str : String , obj : AnyObject) {
        print("MuixSwiftClass.testVoidWithBool")
    }
    

    
//    @objc func testVoidWithTuple(boolValue : Bool , tempInt : Int , tempFloat : Float) -> (Bool , Int , Float){
//        print("MuixSwiftClass.testVoidWithTuple")
//        return (boolValue,tempInt,tempFloat)
//    }
//
//    @objc func testVoidWithCharacter(char : Character ) {
//        print("MuixSwiftClass.testVoidWithCharacter")
//    }

}
extension MuixSwiftClass {
  @objc func swizzle_viewWillAppear(_ animated: Bool) {
        swizzle_viewWillAppear(animated)
        print("swizzle_viewWillAppear")
    }
    @objc func swizzle_testObjc() {
        print("swizzle_testObjc")
    }
    
    @objc func swizzle_testObjectDynamic() {
        print("swizzle_testObjectDynamic")
    }
}

extension MuixSwiftClass: SelfAware{
    func testSwizzling() {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzle_viewWillAppear(_:))
        swizzlingForClass(MuixSwiftClass.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
        
        let originObjc = #selector(testObjc)
        let swizzledObjc = #selector(swizzle_testObjc)
        swizzlingForClass(MuixSwiftClass.self, originalSelector: originObjc, swizzledSelector: swizzledObjc)
  
        let originObjcDynamic = #selector(testObjcDynamic)
        let swizzledObjcDynamic = #selector(swizzle_testObjectDynamic)
        swizzlingForClass(MuixSwiftClass.self, originalSelector: originObjcDynamic, swizzledSelector: swizzledObjcDynamic)
        
        
        testObjc()
        testObjcDynamic()
    }
}


//MARK: - Protocol
protocol SelfAware: AnyObject {
    func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector)
}

extension SelfAware {
     func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
             method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}

//MARK: - Demo
class SDRuntimeDemo {
    func testMain() {
//        print("\r\n++++++++++++++++")
//        showClsRuntime(cls: MuixSwiftClass.self)
//        print("\r\n++++++++++++++++")
//        showClsRuntime(cls: PureSwiftClass.self)
        
        print("\r\n++++++++++++++++")
        
        let muix = MuixSwiftClass()
        muix.testSwizzling()
        
        
        let pure = PureSwiftClass()
        pure.testSwizzling()
        pure.testPureAction()
    }
    
    func showClsRuntime (cls: AnyClass)  {
        print("----------方法列表开始-----------")
        var  methodNum: UInt32 = 0
        let methodList: UnsafeMutablePointer<objc_property_t>! = class_copyMethodList(cls, &methodNum)
        for index in 0..<numericCast(methodNum) {
            let method: Method = methodList[index]
            if let methodName: String = String(utf8String: property_getName(method)){
                print(methodName)
            }
        }
        print("----------方法列表结束-----------")
        free(methodList)
        print("----------属性列表开始-----------")
        
        var propertyNum: UInt32 = 0
        let propertyList: UnsafeMutablePointer<objc_property_t>! = class_copyPropertyList(cls, &propertyNum)
        for index in 0..<numericCast(propertyNum) {
            let property: objc_property_t = propertyList[index]
            if let proName: String = String(utf8String: property_getName(property)){
                print(proName)
            }
        }
        free(propertyList)
        print("----------属性列表结束-----------")
    }
    

    
}
