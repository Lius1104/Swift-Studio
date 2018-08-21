//
//  StructureClassVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/17.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

/*
 *  Structures and Classes
 */

import UIKit

struct SomeStructure {
    // structure definition goes here
    static var storedTypeProperty = "Some value."
    // 只读 计算属性，也可以定义为 读写属性
    static var computedTypeProperty: Int {
        return 1
    }
    static var count: Int {
        get {
            let newCount = computedTypeProperty * 2
            return newCount
        }
        set {
            storedTypeProperty = "newValue / 2"
        }
    }
}

enum SomeEnum {
    static var storedTypeProperty = "Some value."
    // 只读 计算属性
    static var computedTypeProperty: Int {
        return 6
    }
}

class someClass {
    // class definition goes here
    // 类属性
    static var storedTypeProperty = "Some value."
    // static 关键字：类方法
    static var computedTypeProperty: Int {
        // 只读 计算属性
        return 27
    }
    // class 关键字：允许子类重载
    class var overrideableComputedTypeProperty: Int {
        // 只读 计算属性
        return 107
    }
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

enum OtherCompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
    
    
}

class DataImporter {
    var fileName = "data.txt"
    
}

class DataManager {
    // 如果同时由多线程访问标记为lazy修饰的属性，且该属性尚未初始化，则无法保证该属性仅初始化一次
    lazy var importer = DataImporter()
    var data = [String]()
    
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        // 只要为 totalSteps 分配值，就会调用 willSet 和 didSet
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps)")
//        }
        willSet { // 默认值 newValue
            print("About to set totalSteps to \(newValue)")
        }
        didSet { // 默认值 : oldValue
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 不会再次调用 didSet 方法
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
    
}

class StructureClassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        print("The width of someResolution is \(someResolution.width).")
        print("The width of VideoMode is \(someVideoMode.resolution.width).")
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is \(someVideoMode.resolution.width).")
        
        let vga = Resolution(width: 640, height: 480)
        print("vga height is \(vga.height).")
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema is now \(cinema.width) pixels wide.")
        print("hd width still is \(hd.width) pixels wide.")
        
        var currentDirection = OtherCompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection.turnNorth()
        
        print("The current direction is \(currentDirection).")
        print("The remember direction is \(rememberedDirection).")
        
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate).")
        
        // === and !== 判断 是否指向同一个内存地址
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6
        
        // 结构体实例化为常量 后 结构体中的属性即使时变量也无法修改
        // 结构体是值类型，当值类型初始化为常量时，所有属性都被标记为常量
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//        rangeOfFourItems.firstValue = 6 // Cannot assign to property: 'rangeOfFourItems' is a 'let' constant
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        print(manager.importer.fileName)
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let initSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at \(square.origin.x), \(square.origin.y)")
        
        let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume).")
        
        print("\n\n")
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
        
        // 全局变量 and 局部变量
        
        // Type property
        print(SomeStructure.storedTypeProperty)
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        SomeStructure.count = 5
        print(SomeStructure.storedTypeProperty)
        print(SomeEnum.computedTypeProperty)
        print(someClass.computedTypeProperty)
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannel)
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannel)
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
