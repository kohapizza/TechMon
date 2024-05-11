//
//  Charactor.swift
//  TechMon
//
//  Created by Owner on 2023/03/08.
//

import UIKit

class Enemy {
    
    // キャラクターの固有値
    var name: String = ""
    var image: UIImage!
    
    // 攻撃力
    var attackPoint: Float = 0
    
    // 現在のステータス
    var currentHP: Float = 0
    
    // 最大値
    var maxHP: Float = 0
    
    // initで全て設定できるようにする
    init(name: String, imageName: String, attackPoint: Float, maxHP: Float) {
        self.name = name
        self.image = UIImage(named: imageName)
        self.attackPoint = attackPoint
        self.maxHP = maxHP
        self.currentHP = maxHP
    }

}
