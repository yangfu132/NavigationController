//
//  TestMainActorDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/10.
//

import Foundation
import UIKit
class TestMainActorDemo {
    let lable = UILabel()
    
    func testMain() {
        
    }
    
    @MainActor
    func updateUI() {
        lable.text = "Update on main thread"
    }
    
    func fetchData() async {
        let data = await someAsyncFunction()
        print(data)
        await updateUI()
    }
    
    func someAsyncFunction() async -> Int {
        return 1
    }
    
}
