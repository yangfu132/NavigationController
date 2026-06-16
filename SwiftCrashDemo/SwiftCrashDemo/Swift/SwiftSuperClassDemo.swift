//
//  SwiftSuperClassDemo.swift
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/4.
//

import Foundation

class SwiftSuperClassDemo {
    func testMain() {
        let superDemo = SwiftSuperClass()
        superDemo.cannotOverride()
//        superDemo.mustOverride()
        
        let subDemo = SwiftSubClass()
        subDemo.cannotOverride()
        subDemo.mustOverride()
    }
}

class SwiftSuperClass {
    //防止子类重写
    final func cannotOverride(){
        NSLog("SwiftSuperClass cannotOverride")
    }
    
    func mustOverride() {
        NSLog("SwiftSuperClass mustOverride")
//        fatalError("must override")
    }
}

protocol SwiftMustOverrideProtocol {
    func mustOverride()
}

typealias SwiftMustOverrideClass = SwiftSuperClass & SwiftMustOverrideProtocol

class SwiftSubClass:SwiftMustOverrideClass {
    //Error:
    //    Instance method overrides a 'final' instance method
    //override func cannotOverride() {}
}
