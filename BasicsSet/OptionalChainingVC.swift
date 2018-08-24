//
//  OptionalChainingVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/23.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class OptionalChainingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Optional Chaining"
        // Do any additional setup after loading the view.
        // 可选链接可以作为强制解包的替换方案
        // optional 等于 nil，可选链接正常失败，强制解包触发运行时错误
        let john = Person()
//        let roomCount = john.residence!.numberOfRooms// 运行时错误
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
//        john.residence = Residence()
//        if let roomCount = john.residence?.numberOfRooms {
//            print("John's residence has \(roomCount) room(s).")
//        } else {
//            print("Unable to retrieve the number of rooms.")
//        }
        
        let someAddress = Address()
//        someAddress.buildingNumber = "29"
//        someAddress.street = "Acacia Road"
//        john.residence?.address = someAddress
        john.residence?.address = creatAddress()// residence === nil, 右侧方法根本不执行
        
        
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        
        if (john.residence?.address = someAddress) != nil {
            print("It was possible to set the address.")
        } else {
            print("It was not possible to set the address.")
        }
        
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        
        john.residence?[0] = Room(name: "Bathroom")
        
        let johnsHouse = Residence()
        johnsHouse.rooms.append(Room(name: "Living Room"))
        johnsHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = johnsHouse
        
        if let firstRoomName = john.residence?.rooms[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        print(testScores)
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brain"]?[0] = 72
        print(testScores)
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            print("John's building identifier is \(buildingIdentifier).")
        }
        
        if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".")
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
    }
    
    func creatAddress() -> Address {
        print("Function was called.")
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        
        return someAddress
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Person {
    var residence: Residence?
    
}

class Residence {
//    var numberOfRooms = 1
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
    
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
    
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
