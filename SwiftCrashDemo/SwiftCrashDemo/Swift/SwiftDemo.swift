//
//  SwiftDemo.swift
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/4.
//

import Foundation

class SwiftDemo {
    func testMain() {
        testSuper()
        testDefer()
    }
    
    func testDefer() {
        let demo = SwiftDeferDemo()
        demo.testMain()
    }
    
    func testSuper() {
        let demo = SwiftSuperClassDemo()
        demo.testMain()
    }
}
