//
//  SwiftObjectDemo.swift
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

import UIKit

struct StructDemo {
     var a = 0;
}



class SwiftObjectDemo: NSObject {
    final func testMain() {
        let stringDemo = "String"
        print("\(type(of: stringDemo))")
    }
}
