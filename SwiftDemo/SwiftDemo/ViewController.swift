//
//  ViewController.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/12.
//

import UIKit


class ViewController: UIViewController {
    
    var boolean_expression:Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        
        let forDemo:TestForClass = TestForClass();
        forDemo.testFor()
        
        let tsStringObj:TestStringClass = TestStringClass();
        tsStringObj.testString()
        
        let tsArrayObj:TestArrayClass = TestArrayClass()
        tsArrayObj.testArray()
        
        testIf();
    }
    
    func testIf() {
        boolean_expression = false;
        if boolean_expression {
            print("boolean_expression:%b",boolean_expression);
        } else {
            print("boolean_expression:\(boolean_expression)");
        }
    }
    
}

