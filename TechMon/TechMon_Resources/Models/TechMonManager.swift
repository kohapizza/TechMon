//
//  TechMonManager.swift
//  TechMon
//
//  Created by Owner on 2023/03/08.
//

import UIKit
import AVFoundation

class TechMonManager {

    static var bgmAudioPlayer: AVAudioPlayer?
    static var seAudioPlayer: AVAudioPlayer?
    
    // アニメーション
    static func damageAnimation(imageView: UIImageView) {
        let animation = CABasicAnimation(keyPath: "position")
        // 一回移動するのにかかる時間
        animation.duration = 0.02
        // 何回移動するか
        animation.repeatCount = 4
        // 一回移動したら自動で戻るようにする（これで揺れたように見える）
        animation.autoreverses = true
        // どこからどこまで移動するか
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.center.x - 5, y: imageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageView.center.x + 5, y: imageView.center.y))
        // アニメーションを適用する
        imageView.layer.add(animation, forKey: "position")
    }
    
    static func vanishAnimation(imageView: UIImageView) {
        UIView.animate(
            withDuration: 1,        // アニメーションの時間
            delay: 0,               // アニメーションがはじまるまでの時間
            options: .curveEaseIn,  // 徐々に加速するようなアニメーションにする
            animations: {           // 最終的にどうなって欲しいか？
                imageView.alpha = 0
        })
    }
    
    // サウンドエフェクト
    static func playSE(fileName: String) {
        // サウンドの初期化
        guard let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            assert(false, "ファイル名が間違っているので、読み込めません")
        }
        
        let fileURL = URL(fileURLWithPath: soundFilePath)
        do {
            seAudioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            seAudioPlayer?.prepareToPlay()
            seAudioPlayer?.play()
            
        } catch let error {
            assert(false, "サウンドの設定中にエラーが発生しました (\(error.localizedDescription))")
        }
    }
    
    static func playBGM(fileName: String) {
        // サウンドの初期化
        guard let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            assert(false, "ファイル名が間違っているので、読み込めません")
        }
        
        let fileURL = URL(fileURLWithPath: soundFilePath)
        do {
            bgmAudioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            bgmAudioPlayer?.numberOfLoops = -1
            bgmAudioPlayer?.prepareToPlay()
            bgmAudioPlayer?.play()
            
        } catch let error {
            assert(false, "サウンドの設定中にエラーが発生しました (\(error.localizedDescription))")
        }
    }
    
    static func stopBGM() {
        // BGMが流れたままなら止められるように
        bgmAudioPlayer?.stop()
    }
}
