//
//  TestAsyncDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/8.
//

import Foundation

class TestAsyncDemo {
    func testMain() {
        
    }

    func testAwait() async {
        await testAsync()
    }
    
    func testAsync() async {
        print("testAsync");
        NSLog("NSLog");
    }
}
