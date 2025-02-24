//
//  TestTaskDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/9.
//

import Foundation

class TestTaskDemo {
    func testMain() {
        testTask()
    }
    
    func testTask() {
        Task{
            await testAsync()
        }
    }
    
    func testAsync() async {
        print("testAsync");
        NSLog("NSLog");
    }
}
