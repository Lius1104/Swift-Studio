//
//  ProtocolsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/27.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

/*
 *  所有继承 protocol 的类、结构、枚举都需要实现 protocol 中的属性，方法（变异方法，初始化方法，一般方法）等；protocol 中的变异方法在 class 中不需要使用 mutating 关键字
 *  delegation
 */

class ProtocolsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let john = P_Person(fullName: "John Appleseed")
        print(john.fullName)
        
        let ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        print(ncc1701.fullName)
        
        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        print("And another one: \(generator.random())")
        
        var lightSwitch = OneOffSwitch.off
        lightSwitch.toggle()
        print(lightSwitch)
        
        var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        
        print(game.textualDescription)
        
        let myDice = [d6, d12]
        print(myDice.textualDescription)
        
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        print(somethingTextRepresentable.textualDescription)
        
        print("")
        
        // 遵循协议的集合
        let things: [TextRepresentable] = [game, d6, simonTheHamster]
        for thing in things {
            print(thing.textualDescription)
        }
        
        print("")
        print(game.prettyTextualDescription)
        
        let birthdayPerson = C_Person(name: "Malcolm", age: 21)
        wishHappyBirthday(to: birthdayPerson)
        
        let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
        beginConcert(in: seattle)
        
        let objects: [AnyObject] = [
            Crcle(radius: 2.0),
            Country(area: 243_610),
            Animals(legs: 4)
        ]
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        
        let counter = Counters()
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }
        
        print("Here's a random number: \(generator.random())")
        print("And here's a random Boolean: \(generator.randomBool())")
        
        let equalNumbers = [100, 100, 100, 100, 100]
        let differentNumbers = [100, 100, 200, 100, 200]
        print(equalNumbers.allEqual())
        print(differentNumbers.allEqual())
        
    }
}

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doseNotNeedToBeettable: Int { get }
    static func someTypeNethod()
    init(someParameter: Int)
    
}

protocol AnotherProtocol {
    // 类属性: static
    static var someTypeProperty: Int { get set }
}

//struct OtherStruct: SomeProtocol {
//    var mustBeSettable: Int
//    var doseNotNeedToBeettable: Int
//}

class OtherClass: SomeClass, SomeProtocol {
    var mustBeSettable: Int
    var doseNotNeedToBeettable: Int
    static func someTypeNethod() {
        //
    }
    required init(someParameter: Int) {
        self.mustBeSettable = 0
        self.doseNotNeedToBeettable = 0
        super.init()
    }
}

protocol FullyNamed {
    var fullName: String { get }
    
}

struct P_Person: FullyNamed {
    var fullName: String
    
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OneOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

protocol P_SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
    }
}

class SomeSubClass: SomeSuperClass, P_SomeProtocol {
    required override init() {
        //
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
    
    
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {// AnyObject 标记 DiceGameDelegate 仅限 类 使用
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

// 有条件的遵循协议，Array 的 扩展 ，当数组中的元素遵从协议 TextRepresentable 时，数组遵循协议
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}

// 协议继承
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

//protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//    // class-only protocol definition goes here
//}

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct C_Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

protocol HasArea {
    var area: Double { get }
}

class Crcle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animals {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counters {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

// 为协议扩展添加约束，每个元素可等值
extension Collection where Element: Equatable  {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
