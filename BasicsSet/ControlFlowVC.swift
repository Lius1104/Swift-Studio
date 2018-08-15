//
//  ControlFlowVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/15.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class ControlFlowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
         //for-in
         //遍历数组
         let names = ["Anna", "Alex", "Brian", "Jack"]
         for name in names {
         print("Hi, \(name)!")
         }
         //遍历字典
         let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
         for (animalName, legCount) in numberOfLegs {
         print("\(animalName)s have \(legCount) legs")
         }
         
         for index in 1...5 {
         print("\(index) times 5 is \(index * 5)")
         }
         
         let base = 3
         let power = 10
         var answer = 1
         for _ in 1...power {
         answer *= base
         }
         print("\(base) to the power of \(power) is \(answer)\n")
         
         let minutes = 60
         for tickMark in 0..<minutes {
         print("\(tickMark + 1),", terminator: "")
         }
         print("")
         
         let minuteInterval = 5
         for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
         //stride(from:, to:, by) 开区间
         print("\(tickMark), ", terminator: "")
         }
         print("")
         
         let hours = 12
         let hourInterval = 3
         for tickMark in stride(from: 0, through: hours, by: hourInterval) {
         //通过使用 stride(from：through：by :) 封闭范围
         print("\(tickMark), ", terminator: "")
         }
         print("")
         
         //while loop
         let finalSquare = 25
         var board = [Int](repeating: 0, count: finalSquare + 1)
         board[3] = +08; board[6] = +11; board[9] = +09; board[10] = +02
         board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
         
         var square = 0
         var diceRoll = 0
         while square < finalSquare {
         diceRoll += 1
         if diceRoll == 7 { diceRoll = 1 }
         square += diceRoll
         if square < board.count {
         square += board[square]
         }
         }
         print("Game over!")
         
         //repeat-while (do-while)
         square = 0
         diceRoll = 0
         repeat {
         square += board[square]
         diceRoll += 1
         if diceRoll == 7 { diceRoll = 1 }
         square += diceRoll
         } while square < finalSquare
         print("Game over!")
         
         // if
         var tempertureInFahrenheit = 30
         if tempertureInFahrenheit <= 32 {
         print("It's very cold. Consider wearing a scarf.")
         } else {
         print("It's not that cold. Wear a t-shirt.")
         }
         
         // switch
         let someCharater: Character = "a"
         
         switch someCharater {
         case "z":
         print("The last letter of the alphabet")
         case "a":
         print("The first letter of the alphabet")
         default:
         print("Some other character")
         }
         
         let anotherCharacter: Character = "a"
         //        switch anotherCharacter {
         //        case "a":
         //            print("the letter a.")
         //        case "A":
         //            print("the letter A.")
         //        default:
         //            print("not the letter A.")
         //        }
         switch anotherCharacter {
         case "a", "A":
         print("The letter A")
         default:
         print("Not the letter A")
         }
         // switch 区间匹配
         let approximateCount = 62
         let countedThings = "moons orbiting Saturn"
         let naturalcount: String
         switch approximateCount {
         case 0:
         naturalcount = "no"
         case 1..<5:
         naturalcount = "a few"
         case 5..<12:
         naturalcount = "several"
         case 12..<100:
         naturalcount = "dozens of"
         case 100..<1000:
         naturalcount = "hundreds of"
         default:
         naturalcount = "many"
         }
         print("There are \(naturalcount) \(countedThings).")
         
         // switch 元组
         let somePoint = (1, 1)
         switch somePoint {
         case (0, 0):
         print("\(somePoint) is at the origin")
         case (_, 0):
         print("\(somePoint) is on the x-axis")
         case (0, _):
         print("\(somePoint) is on the y-axis")
         case (-2...2, -2...2):
         print("\(somePoint) is inside the box")
         default:
         print("\(somePoint) is outside of the box")
         }
         
         // switch 值绑定
         let anotherPoint = (2, 1)
         switch anotherPoint {
         case (let x, 0):
         print("on the x-axis with an x value of \(x)")
         case (0, let x):
         print("on the y-axis with a y value of \(x)")
         case let (x, y):
         print("somewhere else at (\(x), \(y))")
         }
         
         // switch case-where
         let yetAnotherPoint = (1, -1)
         switch yetAnotherPoint {
         case let (x, y) where x == y:
         print("(\(x), \(y)) is on the line x == y")
         case let (x, y) where x == -y:
         print("(\(x), \(y)) is on the line x == -y")
         case let (x, y):
         print("(\(x), \(y)) is just some arbitrary point")
         }
         
         // switch 复合案例
         // 相当于 OC 中的
         /*
         case "a":
         case "A":
         */
         let someCharacter: Character = "e"
         switch someCharacter {
         case "a", "e", "i", "o", "u":
         print("\(someCharacter) is a vowel")
         case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
         print("\(someCharacter) is a consonant")
         default:
         print("\(someCharacter) is not a vowel or a consonant")
         }
         
         // switch 复合案例 值绑定
         let stillAnotherPoint = (9, 0)
         switch stillAnotherPoint {
         case (let distance, 0), (0, let distance):
         print("On an axis, \(distance) from the origin")
         default:
         print("Not on an axis")
         }
         */
        
        // 控制转移声明
        /*
         * continue、
         * break、
         * fallthrough、
         * return、
         * throw
         
         // Fallthrough 直通
         let integerToDescribe = 5
         var description = "The number \(integerToDescribe) is"
         switch integerToDescribe {
         case 2, 3, 5, 7, 11, 13, 17, 19:
         description += "a prime number, and also"
         fallthrough
         default:
         description += " an integer."
         }
         print(description)
         
         // labeled statements
         let finalSquare = 25
         var board = [Int](repeating: 0, count: finalSquare + 1)
         board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
         board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
         var square = 0
         var diceRoll = 0
         var count = 0
         
         gameLoop: while square != finalSquare {
         count += 1
         diceRoll += 1
         if diceRoll == 7 {
         diceRoll = 1
         }
         switch (square + diceRoll) {
         case finalSquare:
         break gameLoop
         case let newSquare where newSquare > finalSquare:
         continue gameLoop
         default:
         square += diceRoll
         square += board[square]
         }
         }
         print("After \(count) count, Game over!")
         */
        
        greet(person: ["name": "John"])
        greet(person: ["name": "John", "location": "Cupertino"])
        
        // API可用性检测
        if #available(iOS 9.0, macOS 10.12, *) {
            print("Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS")
        } else {
            print("Fall back to earlier iOS and macOS APIs")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }
        print("Hello \(name)!")
        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }
        print("I hope the weather is nice in \(location)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
