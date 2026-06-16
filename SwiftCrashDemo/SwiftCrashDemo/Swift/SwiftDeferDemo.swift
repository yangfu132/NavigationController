//
//  SwiftDeferDemo.swift
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/4.
//

/**
 作者：iOS沐橙君
 链接：https://juejin.cn/post/7036626686737121287
 来源：稀土掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import Foundation

class SwiftDeferDemo {
    func testMain() {
        testLock()
//        testLockDoSomething()
        testLockDoSomethingIf()
        testDeferCopy()
    }
    
    func testFileOld(descriptor: Int32){
        let onlyRead = true
        let shouldWrite = false
        let someData:Data = Data()
        
        let fileHandle = FileHandle(fileDescriptor: descriptor)
        
        let data = fileHandle.readDataToEndOfFile()
        
        if onlyRead {
            fileHandle.closeFile()
            return
        }
        
        guard shouldWrite else {
            fileHandle.closeFile()
            return
        }
        
        fileHandle.seekToEndOfFile()
        fileHandle.write(someData)
        fileHandle.closeFile()
    }
    
    func testFileDefer(descriptor: Int32){
        let onlyRead = true
        let shouldWrite = false
        let someData:Data = Data()
        
        let fileHandle = FileHandle(fileDescriptor: descriptor)
        defer {
            do {
                try fileHandle.close()
            } catch {
                
            }
            
        }
        
        let data = fileHandle.readDataToEndOfFile()
        
        if onlyRead { return }
        
        guard shouldWrite else { return }
        
        fileHandle.seekToEndOfFile()
        fileHandle.write(someData)
    }
    
    let lock = NSLock()
    var tasks:[String:SDTask] = [:]
    
    func remove(_ taskId:String) {
        NSLog("lock")
        lock.lock()
        defer {
            lock.unlock()
            NSLog("unlock")}
        tasks.removeValue(forKey: taskId)
        
    }
    
    func removeIf(_ taskId:String, _ acquireLock:Bool) {
        if acquireLock {
            lock.lock()
            //'defer' statement at end of scope always executes immediately; replace with 'do' statement to silence this warning
            defer {lock.unlock()}
        }
        tasks.removeValue(forKey: taskId)
        
    }
    
    func doSomethingThenRemove() {
        NSLog("lock")
        lock.lock()
        defer {
            lock.unlock()
            NSLog("unlock")
        }
        remove("doSomethingThenRemove")
    }
    
    func doSomethingThenRemoveIf() {
        NSLog("lock")
        lock.lock()
        defer {
            lock.unlock()
            NSLog("unlock")
        }
        removeIf("doSomethingThenRemove",false)
    }
    
    func testLock() {
        tasks["remove"] = SDTask(taskId: "remove")
        remove("remove")
    }
    
    func testLockDoSomething() {
        tasks["doSomethingThenRemove"] = SDTask(taskId: "doSomethingThenRemove")
        doSomethingThenRemove()
    }
    
    func testLockDoSomethingIf() {
        tasks["doSomethingThenRemove"] = SDTask(taskId: "doSomethingThenRemove")
        doSomethingThenRemoveIf()
    }
    
    func testDeferCopy() {
        var number = 1
        defer { print("defer Statement 1: \(number)") }
        
        var closureNumber = number
        defer { print("defer Statement 2: \(closureNumber)") }
        
        number = 100
        print("Statement 1: \(number)")
    }
    
    func testDeferLeave() {
        let f = Foo()
        f.foo() // 0
        f.foo() // 1
        f.num   // 2
    }
}

class Foo {
    var num = 0
    func foo() -> Int {
        defer { num += 1 }
        return num
    }
}

struct SDTask {
    var taskId:String = "??"
}
