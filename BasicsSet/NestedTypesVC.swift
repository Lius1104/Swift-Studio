//
//  NestedTypesVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/24.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class NestedTypesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "嵌套类型"
        // Do any additional setup after loading the view.
        let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
        print("theAceOfSpades: \(theAceOfSpades.description)")
        
        // 要在其定义上下文之外使用嵌套类型，请在其名称前面加上嵌套在其中的类型的名称
        let heartSymbol = BlackjackCard.Suit.hearts.rawValue
        let spadeSymbol = Suit.spades//只能打印出 spades，没有 rawValue
        print("heartSymbol : \(heartSymbol)")
        print("spadeSymbol : \(spadeSymbol)")
        
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

// 嵌套类型
struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

// 参考嵌套类型

