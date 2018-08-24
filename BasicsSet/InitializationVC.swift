//
//  InitializationVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/22.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

struct Fahrenheit {
//    var temperature: Double
//    init() {
//        temperature = 32.0 // 初始值
//    }
    var temperature = 32.0 // 默认值
    
}

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

struct Color {
    let red, yellow, blue: Double
    init(red: Double, yellow: Double, blue: Double) {
        self.red = red
        self.yellow = yellow
        self.blue = blue
    }
    init(white: Double) {
        red = white
        yellow = white
        blue = white
    }
    
}

class SurveyQuestion {
//    var text: String
    let text: String
    
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    
}

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purhased = false
}

struct AnotherSize {
    var width = 0.0, height = 0.0
    
}

struct AnotherRect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
        
    }
    // 便利构造器
//    convenience init(<#parameters#>) {
//        <#statements#>
//    }
    
}

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
    
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
}

class AnotherShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

struct Animal {
    var species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

enum TemperatureUnit: Character {
//    case kelvin, celsius, fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .kelvin
//        case "C":
//            self = .celsius
//        case "F":
//            self = .fahrenheit
//        default:
//            return nil
//        }
//    }
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Unnamed]"
    }
    // init?() 可以覆盖 init(), init() 不能覆盖 init()?
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Unnamed]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Unnamed]")!//强制解包超类的 init?() 作为子类的 init() 的一部分, 如果传入空字符串，则强制解包会发生运行时错误
    }
}

class RequiredClass {
    required init() {
        // required 关键字标记每一个子类必须实现的初始化方法 ，在子类中重写该初始化方法时，也要加上 required 关键字 不用加 override
    }
}

class SubRequiredClass: RequiredClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

// 使用闭包或函数设置默认属性值
//class SomeClass {
//    let someProperty: SomeType = {
//        // create a default value for someProperty inside this closure
//        // someValue must be of the same type as SomeType
//        // 不能在闭包中访问任何其他属性，不能使用隐式self，不能调用任何实例方法
//        return someValue
//    }()// () 告诉swift立即关闭，如果省略这些括号，则试图将闭包本身分配给属性，而不是闭包的返回值
//}

struct Chessboard {
//    let boardColors: [Bool] = {
//        var temporaryBoard = [Bool]()
//        var isBlock = false
//        for
//        return temporaryBoard
//    }()
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class CoinsPlayer {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

class InitializationVC: UIViewController {

    // 在初始化函数中设置属性初始值或给c属性设置默认值时不会调用 属性观察者
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let f = Fahrenheit()
        print("The default tempature is \(f.temperature)")
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        print("\(boilingPointOfWater.temperatureInCelsius)")
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        print("\(freezingPointOfWater.temperatureInCelsius)")
        
        let bodyTemperature = Celsius(37.0)
        print("\(bodyTemperature.temperatureInCelsius)")
        
        
        let magenta = Color(red: 1.0, yellow: 0.0, blue: 1.0)
        print(magenta)
        let halfGary = Color(white: 0.5)
        print(halfGary)
        
        let cheeseQuestion = SurveyQuestion(text: "How about cheese?")
        cheeseQuestion.ask()
        cheeseQuestion.response = "Yes, I do like cheese."
        
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        
        let item = ShoppingListItem()
        print(item)
        
        let twoByTwo = AnotherSize(width: 2.0, height: 2.0)
        print(twoByTwo)
        
        // 初始化函数的委派：值类型和类类型的委派规则不同
        // 值类型（结构/枚举）不支持继承，只能自己调用自己的self.init, 如果为值类型定义了自定义初始值设定项，就无法再访问该类型的默认初始值设定项（如果自定义了初始化方法，就不能调用默认的初始化方法init）
        // 类类型可以从其他类继承
        
        // struct 初始化函数委派
        let basicRect = AnotherRect()
        let originRect = AnotherRect(origin: Point(x: 2.2, y: 2.2), size: Size(width: 5.5, height: 5.5))
        let centerRect = AnotherRect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        
        print("")
        
        // 类继承和初始化
        // 便利构造器
        // 子类默认不继承其超类的初始化方法
        
        let vehicle = Vehicle()
        print("Vehicle: \(vehicle.description)")
        
        let bicycle = Bicycle()
        print("Bicycle: \(bicycle.description)")
        
        print("")
        
        let nameMeat = Food(name: "Bacon")
        print("nameMeat: \(nameMeat.name)")
        let mysteryMeat = Food()
        print("mysteryMeat: \(mysteryMeat.name)")
        
        let oneMysteryItem = RecipeIngredient()
        let oneBacon = RecipeIngredient(name: "Bacon")
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
        
        var breakFastList = [
            AnotherShoppingListItem(),
            AnotherShoppingListItem(name: "Bacon"),
            AnotherShoppingListItem(name: "Eggs", quantity: 6)
        ]
        breakFastList[0].name = "Orange juice"
        breakFastList[0].purchased = true
        for item in breakFastList {
            print(item.description)
        }
        
        let wholeNumber: Double = 12345.0
        let pi = 3.14159
        
        if let valueMaintained = Int(exactly: wholeNumber) {
            print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
        }
        
        let valueChanged = Int(exactly: pi)
        if valueChanged == nil {
            print("\(pi) conversion to Int does not maintain value")
        }
        
        let someCreature = Animal(species: "Giraffe")
        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        
        let anonymousCreature = Animal(species: "")
        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized")
        }
        
//        let fahrenheitUnit = TemperatureUnit(symbol: "F")
//        if fahrenheitUnit != nil {
//            print("This is a defined temperature unit, so initialization succeeded.")
//        }
//        let unknownUnit = TemperatureUnit(symbol: "X")
//        if unknownUnit == nil {
//            print("This is not a defined temperature unit, so initialization failed.")
//        }
        let fahrenheitUnit = TemperatureUnit(rawValue: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        
        let unknowUnit = TemperatureUnit(rawValue: "X")
        if unknowUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        
        
        if let twoSocks = CartItem(name: "sock", quantity: 2) {
            print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
        }
        
        if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
            print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
            print("Unable to initialize zero shirts")
        }
        
        if let oneUnnamed = CartItem(name: "", quantity: 1) {
            print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
        } else {
            print("Unable to initialize one unnamed product")
        }
        
        let untitledDoc = UntitledDocument()
        print("untitledDoc: \(untitledDoc)")
        
        let board = Chessboard()
        print(board.squareIsBlackAt(row: 0, column: 1))
        print(board.squareIsBlackAt(row: 7, column: 7))
        
        var playerOne: CoinsPlayer? = CoinsPlayer(coins: 100)
        print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        print("There are now \(Bank.coinsInBank) coins left in the bank")
        playerOne!.win(coins: 2_000)
        print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        print("The bank now only has \(Bank.coinsInBank) coins left")
        
        playerOne = nil
        print("PlayerOne has left the game")
        print("The bank now has \(Bank.coinsInBank) coins")
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
