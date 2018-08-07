//
//  ViewController.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/2.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         print("hello world")
         //常量let 变量var
         let indexLet = 70
         let count: Float = 4
         var indexVar = 10
         indexVar -= 1
         var countVar: Double = 5
         countVar += 1
         print(indexLet, indexVar, count, countVar)
         //强制类型转化
         let label = "the label width is "
         let width = 70
         let labelWidth = label + String(width)
         print(labelWidth)
         // \()
         let apples = 3
         let oranges = 5
         let printApple = "I have \(apples) apples."
         let printOranges = "I have \(oranges) oranges."
         let totalFruit = "I have \(apples + oranges) pieces of fruit."
         print(printApple, printOranges, totalFruit)
         
         //""" 多行字符串
         let quotation = """
         I say "I have \(apples) apples"
         And then I say "I have \(oranges) oranges"
         """
         print(quotation)
         
         //数组，字典
         var array = ["array0", "array1", "array2",]
         array[1] = "test"
         array.append("append")
         var dic = [
         "key0" : "value0",
         "key1" : "vaule1"
         ]
         dic["key0"] = printApple
         print(array)
         print(dic)
         //初始化空数组，空字典
         let emptyArray = [String]()
         let emptyDic = [String: Float]()
         print(emptyArray)
         print(emptyDic)
         
         // control flow
         for item in array {
         print(item)
         }
         
         let scoreArray = [78, 54, 20, 97, 88]
         var totalScore = 0
         for score in scoreArray {
         if score > 60 {
         totalScore += 3
         } else {
         totalScore += 1
         }
         }
         print(totalScore)
         
         //if 条件语句 ?的用法
         let nameStr: String? = "Lius"
         print(nameStr == nil)
         
         let desStr: String? = nil
         var greeting = "Hello! "
         
         if let des = desStr {
         greeting = "Hello, \(des)"
         }
         print(greeting)
         
         // ??提供默认值
         let nickName: String? = "Shuang"
         let fullName: String = "Lau"
         let info = "Hi, \(nickName ?? fullName)"
         print(info)
         
         // switch
         let vegeable = "red pepper"
         switch vegeable {
         case "red":
         print("Add some raisins and make ants on a log.")
         case "blue", "white":
         print("That would make a good tea sandwich.")
         case let x where vegeable.hasSuffix("pepper"):
         print("Is it a spicy \(x)?")
         default:
         print("Everything tastes good in soup.")
         }
         
         //字典遍历
         let interestingNumbers = [
         "Prime" : [2, 3, 5, 7, 11, 13],
         "Fibonacci" : [1, 1, 2, 3, 5, 8],
         "Square" : [1, 4, 9, 16, 25]
         ]
         var larest = 0
         var keyStr: String = ""
         for (kind, numbers) in interestingNumbers {
         for num in numbers {
         if num > larest {
         keyStr = kind
         larest = num
         }
         }
         }
         print(keyStr)
         print(interestingNumbers[keyStr]?.count)
         print(larest)
         
         // while
         var n = 2
         while n < 100 {
         n *= 2
         }
         print(n)
         
         var m = 2
         repeat {
         m *= 2
         } while m < 100
         print(m)
         
         // ..循环中的索引
         var total = 0
         
         for i in 2..<4 {
         total += i;
         }
         print(total)
 
        
        func greet(person: String, day: String) -> String {
            return "Hello, \(person)! today is \(day)."
        }
        let greetStr = greet(person: "Lius", day: "Firday")
        print(greetStr)
        
        //_ 表示不显示 参数名， 在参数名前的其他自定义字符将取代 参数名在调用时显示
        func greetNoPerName(_ person: String, on day: String) {
            print("Hi, \(person)! today is \(day).")
        }
        greetNoPerName("Lius", on: "Monday")
        
        //返回值集合中元素可以通过点语法调用元素名称，或者下标来调用元素
        func calenderNum(scroes: [Int]) -> (max : Int, min: Int, sum: Int) {
            var max = scroes[0]
            var min = scroes[0]
            var sum = 0
            for item in scroes {
                if item > max {
                    max = item
                } else if item < min {
                    min = item
                }
                sum += item
            }
            return (max, min, sum)
        }
        let statistics = calenderNum(scroes: [12, 3, 78, 56, 102, -10])
        print(statistics.sum)
        print(statistics.2)
        
        //方法嵌套
        func returnFifteen() -> Int {
            var y = 10;
            func add() {
                y += 5;
            }
            add()
            return y;
        }
        let fifteen = returnFifteen()
        print(fifteen)
        
        // 方法作为方法返回值
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(number: Int) -> Int {
                return number + 1
            }
            return addOne
        }
        let function = makeIncrementer()
        print(function(12))
        
        //方法作为参数
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(number: Int) -> Bool {
            if number < 10 {
                return true
            }
            return false
        }
        
        let numbers = [1, 23, 4, -10]
        let result = hasAnyMatches(list: numbers, condition: lessThanTen)
        print(result)
        
//        numbers.map({(number: Int) -> Int in
//            let result = number * 3;
//            return result
//        })
        
         let mapResult = numbers.map({number in 3 * number})
         print(mapResult)
         
         let sortNumbers = numbers.sorted { $0 > $1 }
         print(sortNumbers)
         
         let shape = Shape()
         shape.numberOfSides = 3
         let simpleDescription = shape.simpleDescription()
         print(simpleDescription)
         shape.countDescription(count: 1104)
         
         let test = Square(sideLength: 4, name: "Lius")
         print(test.area())
         print(test.simpleDescription())
         
         let testCircle = Circle(radius: 1, name: "Lius")
         print(testCircle.area())
         print(testCircle.simpleDescription())
         
         let triangle = EquilateralTriangle(sideLength: 3.1, name: "Lius")
         print(triangle.perimeter)
         triangle.perimeter = 9.9
         print(triangle.sideLength)
         
         let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
         print(triangleAndSquare.square.sideLength)
         print(triangleAndSquare.triangle.sideLength)
         triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
         print(triangleAndSquare.triangle.sideLength)
         
         let optionalSquare: Square? = Square(sideLength: 3.5, name: "Lius")
         let sideOfLength = optionalSquare?.sideLength
         print(sideOfLength!)
         
         // enum
         let ace = Rank.ace
         let aceRawValue = ace.simpleDescription()
         print(aceRawValue)
         let secondRank = Rank.queen
         let result = ace.compress(first: ace, second: secondRank)
         print(result)
         
         if let aceRank = Rank(rawValue: 1) {
         print(aceRank.simpleDescription())//ace
         }
         
         let nineRank = Rank(rawValue: 9)
         if nineRank != nil {
         let nineRankDescription = nineRank?.simpleDescription()
         print(nineRankDescription)//Optional("9")
         }
         
         let hearts = Suit.hearts
         let heartDescription = hearts.simpleDescription()
         print(heartDescription)//hearts
         
         let spadesSuit = Suit.spades
         let clubsSuit: Suit = .clubs
         let colorSpades = spadesSuit.color()
         let colorClubs = clubsSuit.color()
         
         print(colorSpades, colorClubs)//blank blank
         
         let success = ServerResponse.result("Lius", "Sara")
         let failure = ServerResponse.failure("Error: 404")
         switch failure {
         case let .result(lius, sara):
         print("My name is \(lius), you can also call me \(sara)")
         case let .failure(error):
         print("Failure:\(error)")
         case let .other(otherMsg):
         print("other is \(otherMsg)")
         }
         
         // 结构体
         let ace = Rank.ace
         let suit = Suit.hearts
         
         let card = Card(rank: ace, suit: suit)
         let cardDescription = card.simpleDescription()
         print(cardDescription)//The ace of hearts
         
         func createFullCards() -> ([Card]) {
         var cards = [Card]()
         for rank in Rank.allValue {
         for suit in Suit.allValue {
         let item = Card(rank: rank, suit: suit)
         cards.append(item)
         }
         }
         return cards
         }
         
         let cards = createFullCards()
         
         //协议 and 扩展
         let a = SimpleClass()
         a.adjust()
         let aDescription = a.simpleDescription
         print(aDescription)
         
         var b = SimpleStructure()
         b.adjust()
         let bDescription = b.simpleDescription
         print(bDescription)
         
         var number = 7
         print(number.simpleDescription)
         number.adjust()
         print(number.simpleDescription)
         
         let absolute = -12.3
         print(absolute.absoluteValue)
         
         /**
         *  You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
         *  Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
         */
         let protocolValue: ExampleProtocol = a
         print(protocolValue.simpleDescription)
         
         // 异常处理
         do {
         let result = try send(job: 12, toPrinter: "other")
         print(result)
         } catch PrintError.onFire {
         print("error")
         } catch let printerError as PrintError {
         print("Error is Print Error, \(printerError).")
         } catch {
         print("other error: \(error)")
         }
         
         let printerSuccess = try? send(job: 1024, toPrinter: "other")
         let printerFailure = try? send(job: 512, toPrinter: "Never Has Toner")//对特别指出的异常不进行处理，直接返回nil
         print(printerSuccess)
         print(printerFailure)
         
         fridgeContains("eggs")
         
         // 泛型
         let result = makeArray(repeating: "Lius", numberOfItems: 4)
         print(result)
         
         var optionalValue: OptionalValue<Int> = .none
         optionalValue = .some(100)
         print(optionalValue)
         
         let result = anyCommonElements([1, 2, 3], [4])
         print(result)
         let result = anyCommonElements(["Lius", "Sara", "Jack"], ["Lius"])
         print(result)
        */
        
        let hexNum = AudioSample.min
    }
    
    func send(job: Int, toPrinter printName: String) throws -> String {
        if printName == "Never Has Toner" {
            throw PrintError.noToner
        }
        if printName == "On fire" {
            throw PrintError.onFire
        }
        if printName == "other" {
            throw OtherPrintError.othetError
        }
        return "Job sent"
    }

    var fridgeIsOpen = false

    var fridgeContent = ["milk", "eggs", "leftovers"]
    func fridgeContains(_ food: String) {
        fridgeIsOpen = true
        print("fridgeIsOpen is \(fridgeIsOpen)")
        defer {//在函数中的其他代码都执行完之后再执行，包括return
            fridgeIsOpen = false
            print("defer fridgeIsOpen is \(fridgeIsOpen)")
        }
        let result = fridgeContent.contains(food)
        print("result is \(result)")
        return
    }
    
    func makeArray<Item>(repeating item: Item, numberOfItems: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfItems {
            result.append(item)
        }
        return result
    }
    
    func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Array<T.Iterator.Element>
        where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
            // 泛型 可在 函数实现体之前指定要求列表，用 , 隔开， 泛型的类型，继承的父类，实现的协议等
            var result = Array<T.Iterator.Element>()

            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        result.append(lhsItem)
                        break
                    }
                }
            }
            return result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

enum PrintError: Error {
    case outOfPaper
    case noToner
    case onFire
}

enum OtherPrintError: Error {
    case othetError
}

protocol AbsoluteProtocol {
    var absoluteValue: Double { get }
}

extension Double: AbsoluteProtocol {
    var absoluteValue: Double {
        return fabs(self)
    }
    
}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number is \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

enum SimpleEnumeration: ExampleProtocol {
    case one, two, three
    var simpleDescription: String {
        get {
            switch self {
            case .one:
                return "one"
            case .two:
                return "two"
            case .three:
                return "three"
            }
        }
    }
    mutating func adjust() {
    }
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var otherProperty: Int = 123
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var otherProperty = 123
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    
}

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case other(String)
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    static let allValue = [ace, two, three, four, five, six, .seven, .eight, nine, ten, jack, queen, king]
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func compress(first: Rank, second: Rank) -> String {
        if first.rawValue > second.rawValue {
            return first.simpleDescription()
        } else {
            return second.simpleDescription()
        }
    }
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    static let allValue = [spades, hearts, diamonds, clubs]
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
//        default:
//            <#code#>
        }
    }
    
    func color() -> String {
        switch self {
        case .clubs, .spades:
            return "blank"
        case .hearts, .diamonds:
            return "red"
//        default:
//            <#code#>
        }
    }
}

class Shape {
    var numberOfSides = 0
    let countOfSides = 0
    
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
    
    func countDescription(count: Int) {
        print("the count is \(count).")
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    deinit {
    }
    
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
        
    }
    
    func area() -> Double {
        return sideLength * Double(numberOfSides)
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class Circle: NamedShape {
    var radius: Double = 0
    init(radius: Double, name: String) {
        super.init(name: name)
        self.radius = radius
    }
    
    func area() -> Double {
        return 2 * Double.pi * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle."
    }
    
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangele with sides of length \(sideLength)."
    }
    
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
