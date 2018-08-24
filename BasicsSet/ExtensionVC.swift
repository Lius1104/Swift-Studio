//
//  ExtensionVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/24.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class ExtensionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "扩展"
        /*
         *  为现有的类，结构，枚举 或 协议 添加新功能，包括扩展无法访问的原始源代码的能力（追溯建模），类似 OC 中的 category, 但没有名称
         *  can do :
         *      1. 添加实例属性或基本类型属性，可以添加计算属性，不能添加存储属性也不能添加属性观察者
         *      2. 定义类方法or实例方法
         *      3. 提供新的初始化方法（便利初始化）, 需要保证每个属性都被初始化
         *      4. 定义下标
         *      5. 定义并使用新的嵌套类型
         *      6. 使现有类型遵从协议
         *  warning : 可以添加新功能，但不能覆盖现有功能
         *  关键字 : extension
         */
        /*
         *  存储属性 常规的变量常量定义，（定义在特定的类h， 结构体中的常量或变量）
         *  计算属性 不直接存储值，而是通过getter 和 可选的 setter 方法 间接获取，设置其他属性和变量的值
         *
         */
        // Do any additional setup after loading the view.
        // 1. 扩展 基本数据类型
        let oneInch = 25.4.mm
        print("One Inch is \(oneInch) meters.")
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        let aMarathon = 42.km + 195.m
        print("A marathon is \(aMarathon) meters long")
        // 2. 扩展初始化
        let defaultRect = Rect()
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                                  size: Size(width: 5.0, height: 5.0))
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size(width: 3.0, height: 3.0))
        print("\(defaultRect), \(memberwiseRect), \(centerRect).\n")
        // 3. 扩展方法
        3.repeatitions {
            print("Hello")
        }
        // 变异方法（修改自身或其属性的枚举值或结构体，必须将实例方法标记为变异）
        var square = 5
        square.square()
        print("square : \(square)")
        // 4. 扩展下标
        print("\(746381295[0])")
        print("\(123456789[1])")
        // 5. 嵌套类型 （扩展可以向现有类型添加新的嵌套类型）
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
    }
    
    func printIntegerKinds(_ numbers: [Int]) {
        for number in numbers {
            switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
            }
        }
        print("")
    }

}


//extension SomeTypeClass {
//
//}

//extension SomeTypeClass: SomeProtocal, AnotherProtocal {
//
//}

extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100
    }
    var mm: Double {
        return self / 1_000.0
    }
    var ft: Double {
        return self / 3.28084
    }
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

extension Int {
    func repeatitions(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0 ..< digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
