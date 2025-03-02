//
//  ViewController.swift
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testOCDemo()
    }


    func testOCDemo () {
        let demo = OCObjectDemo()
        demo.testMain()
    }
}

