//
//  ViewController.swift
//  Japanese50
//
//  Created by 林郁琦 on 2024/1/24.
//

import UIKit
//引入AVFoundation框架
import AVFoundation

class ViewController: UIViewController {
    //宣告聲音合成器
    let synthesizer = AVSpeechSynthesizer()
    //把需要設定的UI元件拉進outlet
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    //將日文單字宣告陣列array，用於按下按鈕時朗讀相應的文字。
    let speechText = [ "あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    //點擊空白處或Enter收鍵盤
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
    }
    //設置每一個日文單字按鈕的說話內容、速度、音量
    @IBAction func speak(_ sender: UIButton) {
        let character = speechText[sender.tag]
        let speech = AVSpeechUtterance(string: character)
            speech.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            speech.rate = rateSlider.value
            speech.volume = volumeSlider.value
            synthesizer.speak(speech)
        }
    //設置按下按鈕時，讀出文字輸入框裡的內容、速度、音量
    @IBAction func speakButton(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string: textField.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        speechUtterance.rate = rateSlider.value
        speechUtterance.volume = volumeSlider.value
        synthesizer.speak(speechUtterance)
    }
}
    
    
    


