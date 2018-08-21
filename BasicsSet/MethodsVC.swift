//
//  MethodsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/20.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class Counter {
    var count = 0
    func increment() {
//        count += 1
        self.count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

struct OtherPoint {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
        // 变异方法 可以为隐式self重新分配值
        self = AnotherPoint(x: x + deltaX, y: y + deltaY)
    }
    
}

// 枚举的变异方法可以将隐式self参数设置为与同一枚举不同的情况
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

class SomeTypeClass {
    class func someTypeMethod() {
        // type method implementation gose here
        print("type method implementation gose here")
    }
}

struct LevelTracker {
    static var highesUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highesUnlockedLevel {
            highesUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highesUnlockedLevel
    }
    
    @discardableResult
    // discardableResult 关键字 : 忽略返回值的代码不一定错误
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

class MethodsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let counter = Counter()
        counter.increment()
        print(counter.count)
        counter.increment(by: 5)
        print(counter.count)
        counter.reset()
        print(counter.count)
        
        let somePoint = OtherPoint(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0.")
        }
        
        var anotherPoint = AnotherPoint(x: 1.0, y: 1.0)
        anotherPoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")
        
        // 不能在结构体常量上调用mutating方法，因为它的属性不能改变
        let fixedPoint = AnotherPoint(x: 3.0, y: 3.0)
//        fixedPoint.moveBy(x: 2.0, y: 3.0) // Cannot use mutating member on immutable value: 'fixedPoint' is a 'let' constant
        
        // enum 的变异方法
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        print("\(ovenLight)")
        ovenLight.next()
        print("\(ovenLight)")
        
        SomeTypeClass.someTypeMethod()
        
        var player = Player(name: "Lius")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highesUnlockedLevel).")
        player = Player(name: "ZYL")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6.")
        } else {
            print("level 6 has not yet been unlocked.")
        }
        
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
