//
//  TestTaskGroupDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/9.
//

import Foundation
class TestTaskGroupDemo {
    func testMain() {
        testTaskGroup()
    }
    
    func testTaskGroup () {
        Task{
            await processTasks()
        }
    }
    
    func processTasks() async {
        await withTaskGroup(of: Int.self, body: { group in
            for i in 1...5 {
                group.addTask { [self] in
                    return await performTask(id: i)
                }
            }
            
            var results = [Int]()
            for await result in group {
                results.append(result)
            }
            print("Results:\(results)")
        })
    }
    
    func performTask(id:Int) async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return id * 2
    }
}
