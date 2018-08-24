//
//  InheritanceVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/21.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

// 定义一个基类
class Vehicle {
    // final 关键字: 防止子类覆盖
//    final var currentSpeed = 0.0
    var currentSpeed = 0.0
    var numberOfWheels = 0
    
    var description: String {
//        return "traveling at \(currentSpeed) miles per hour"
        return "\(numberOfWheels) wheel(s)"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
    
}

class Bicycle: Vehicle {
    var hasBasket = false
    override init() {
        super.init()
        numberOfWheels = 2
    }
    
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
    
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class InheritanceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 属性观察者：willSet, didSet
        // 属性观察者不能添加到继承的常量或只读属性，因为无法设置这些属性的值
        
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        
        let train = Train()
        train.makeNoise()
        
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
     
        print("\n")
        
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
