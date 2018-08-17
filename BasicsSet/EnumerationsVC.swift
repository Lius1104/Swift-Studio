//
//  EnumerationsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/17.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

// 枚举语法
enum SomeEnumeration {
    //
}

//enum CompassPoint {
//    case north
//    case south
//    case east
//    case west
//}

// 枚举迭代, Xcode10.0+ beta
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 原始值是 Character 类型
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 原始值 是 Int 类型
// 当 原始值 的 类型是 String 时，隐含值就是每个 case 的文本
enum Planet: Int {
    case merury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {
    case north, south, east, west
}

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

class EnumerationsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "枚举"
        // Do any additional setup after loading the view.
        // 每一个枚举情况都有一个原始值，该值可以是 String，Char，Int，Double
        // 枚举语法
        var directionToHead = CompassPoint.west
        directionToHead = .east
        
        // switch 语句匹配 enum
        directionToHead = .south
        switch directionToHead {
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        case .south:
            print("Watch out for penguins")
        case .north:
            print("Lots of planets have a north")
        }
        
        let somePlanet = Planet.earth
        switch somePlanet {
        case .earth:
            print("Mostly harmless.")
        default:
            print("Not a safe place for humans")
        }
        
        // 迭代枚举案例
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        
        var produceBarcode = Barcode.upc(8, 85909, 51226, 3)
        produceBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        switch produceBarcode {
        case .upc(let numberSystem, let manufacturr, let produce, let check):
            print("UPC: \(numberSystem), \(manufacturr), \(produce), \(check).")
        case .qrCode(let produceCode):
            print("QR code: \(produceCode).")
        }
        
        switch produceBarcode {
        case let .upc(numberSystem, manufactuer, produce, check):
            print("UPC: \(numberSystem), \(manufactuer), \(produce), \(check).")
        case let .qrCode(produceCode):
            print("QR code: \(produceCode)")
        }
        
        // 原始值
        // 隐含的分配原始值，不指定，第一个的默认值就是 0，依次类推
        let earthOrder = Planet.earth.rawValue
        print(earthOrder)
        
        let sunestDirction = CompassPoint.west.rawValue
        print(sunestDirction)
        
        // 从 原始值 初始化
//        let possiblePlanet = Planet(rawValue: 7)
        let positionToFind = 11
        if let somePlanet = Planet(rawValue: positionToFind) {
            switch somePlanet {
            case .earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
        
        // 递归枚举
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let produce = ArithmeticExpression.multiplication(five, four)
        
        print("sum is \(evaluate(sum)), produce is \(evaluate(produce)).")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }

}
