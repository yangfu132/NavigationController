//
//  TestDispatchDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/10.
//

import Foundation

class TestDispatchDemo {
    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
    let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue",attributes: DispatchQueue.Attributes.concurrent)
    
    func testMain() {
        
        // 在主队列中异步执行任务
        DispatchQueue.main.async {
            print("This is running on the main queue")
        }
        
        // 在串行队列中异步执行任务
        let serialBlock = DispatchWorkItem {
            let demo = RunLoop.current
            var cancel = false
            while(cancel && demo.run(mode: RunLoop.Mode.default, before: Date.distantFuture)) {
                cancel = Thread.current.isCancelled
            }
        }
        serialQueue.async(execute: serialBlock)
        
        serialQueue.async {
            print("This is running on a serial queue")
        }
        
        serialBlock.cancel()
        
        // 在并发队列中异步执行任务
        concurrentQueue.async {
            print("This is running on a concurrent queue")
        }
        
        // 使用DispatchGroup来管理一组任务
        let group = DispatchGroup()
        group.enter()
        
        concurrentQueue.async {
            print("Task 1 started")

            
        }
        
        
        
    }
    

    
}
