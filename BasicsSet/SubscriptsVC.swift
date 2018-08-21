//
//  SubscriptsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/21.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func IndexIsVaild(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(IndexIsVaild(row: row, column: column), "Index out of range.")
            return grid[(row * columns) + column]
        }
        set {
            assert(IndexIsVaild(row: row, column: column), "Index out of range.")
            grid[(row * columns) + column] = newValue
        }
    }
}

class SubscriptsVC: UIViewController {

//    subscript(index: Int) -> Int {
//        get {
//            return index
//        }
//        set(newValue) {
//
//        }
//    }
    
    subscript(index: Int) -> Int {
        // readonly
        return 6
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6]).")
        
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
        
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
//        let someValue = matrix[2, 2]
        
        
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
