//
//  testDeInitDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/15.
//

import Foundation
var counter = 0;

class TestDeInitDemo {
    func testMain() {
        testDeinit();
    }
    
    func testDeinit() {
        class BaseClass {
            init() {
                counter += 1;
            }
            
            deinit {
                counter -= 1;
            }
        }
        
        var show:BaseClass? = BaseClass();
        print(counter)
        show = nil;
        print(counter);
    }
}
