//
//  TestOptionDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/16.
//

import Foundation
class TestOptionDemo  {
    func testMain() {
        testOption();
//        testForce();
        testMulti();
    }
    
    func testOption() {
        
        class MiddleDemo {
            var residence: Residence?
        }
        
        class Residence {
            var numberOfRooms = 1
        }
        
        class Persion {
            var middle: MiddleDemo?
        }
        
        let john = Persion();
        
        if let roomCount = john.middle?.residence?.numberOfRooms {
            print("John 的房间号为 \(roomCount)。")
        } else {
            print("不能查看房间号")
        }
    }
    
    func testForce() {
        class Residence {
            var numberOfRooms = 1
        }
        
        class Person {
            var residence: Residence?
        }

        let john = Person()

        //将导致运行时错误
        let roomCount = john.residence!.numberOfRooms
        print("let")
        print("fatal error: unexpectedly found nil while unwrapping an Optional value")
    }
    
    func testMulti() {
        class Room {
            let name:String
            init(name:String) {
                self.name = name
            }
        }
        
        class Address {
            var buildingName:String?
            var buildingNumber:String?
            var street:String?
            func buildingIndentifier() -> String?{
                if (nil != buildingName) {
                    return buildingName
                } else if (nil != buildingNumber) {
                    return buildingNumber
                }else {
                    return nil
                }
            }
        }
        
        //属性，方法，和下标脚本
        class Residence {
            var rooms = [Room]()
            var numberOfRooms:Int {
                return rooms.count
            }
            
            subscript(i:Int)->Room {
                return rooms[i]
            }
            
            func printNumberOfRooms() {
                print("房间号为 \(numberOfRooms)");
            }
            
            var address:Address?
        }
        
        class Person {
            var residence: Residence?
        }
        
        
        let john = Person()
        
        ///通过可选链调用方法
        if (john.residence?.printNumberOfRooms() != nil) {
            print("输出房间号")
        } else {
            print("无法输出房间号")
        }
        
        ///使用可选链调用下标脚本
        if let firstRoomName = john.residence?[0].name {
            print("第一房间名\(firstRoomName)")
        } else {
            print("无法检索到房间")
        }
        
        ///设置值
        let johnsHouse = Residence()
        johnsHouse.rooms.append(Room(name:"客厅"))
        johnsHouse.rooms.append(Room(name:"厨房"))
        john.residence = johnsHouse
        
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        
        if let johnsStreet = john.residence?.address?.street {
            print("John 所在的街道是 \(johnsStreet)。")
        } else {
            print("无法检索到地址。 ")
        }
        
        if let firstRoomName = john.residence?[0].name {
            print("第一个房间名为\(firstRoomName)")
        } else {
            print("无法检索到房间")
        }
        
        
        if let build = john.residence?.address?.buildingIndentifier() {
            print("输出房间号\(build)")
        } else {
            print("无法输出房间号")
        }
        
    }
    
    func testSubscriptOption(){
        var testScores = ["Dave":[86,82,84],"Bev":[79,84,81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
    }
    
    
}
