//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    
    let quiz = [
        Question(question: "Dünyanın en büyük ülkesi Rusya'dır.", answer: "Doğru"),
                Question(question: "Türkiye'nin başkenti Ankara'dır.", answer: "Doğru"),
                Question(question: "Ay'ın yüzeyinde milyarlarca krater vardır.", answer: "Doğru"),
                Question(question: "Dünyanın en büyük gölü Hazar Denizi'dir.", answer: "Doğru"),
                Question(question: "Türkiye'nin resmi dili Türkçe'dir.", answer: "Doğru"),
                Question(question: "Dünyanın en uzun ırmağı Nil Nehri'dir.", answer: "Doğru"),
                Question(question: "Dünyanın en yüksek dağı Everest Dağı'dır.", answer: "Doğru"),
                Question(question: "Dünyanın en kalabalık ülkesi Çin Halk Cumhuriyeti'dir.", answer: "Doğru"),
                Question(question: "Dünyanın en büyük okyanusu Büyük Okyanus'tur.", answer: "Doğru"),
                Question(question: "Dünyanın en büyük kıtası Asya'dır.", answer: "Doğru"),
                Question(question: "Türkiye Cumhuriyeti'nin kurucusu Mustafa Kemal Atatürk'tür.", answer: "Doğru"),
                Question(question: "Türkiye'nin milli marşı İstiklal Marşı'dır.", answer: "Doğru"),
                Question(question: "Türkiye'nin bayrağı kırmızı, beyaz ve yeşil renklerden oluşur.", answer: "Doğru"),
                Question(question: "Türkiye'nin para birimi Türk lirasıdır.", answer: "Doğru"),
                Question(question: "Türkiye'nin başkenti Ankara'dır.", answer: "Doğru"),
                Question(question: "Türkiye'nin en büyük şehri İstanbul'dur.", answer: "Doğru"),
                Question(question: "Türkiye'nin en yüksek dağı Ağrı Dağı'dır.", answer: "Doğru"),
                Question(question: "Türkiye'nin en uzun ırmağı Kızılırmak'tır.", answer: "Doğru"),
                Question(question: "Türkiye'nin en kalabalık ili İstanbul'dur.", answer: "Doğru"),
                Question(question: "Türkiye'nin en büyük gölü Van Gölü'dür.", answer: "Doğru"),
                Question(question: "Dünyanın yaşı yaklaşık 4,5 milyar yıldır.", answer: "Doğru"),
                Question(question: "Güneş, Dünya'nın en yakın yıldızıdır.", answer: "Doğru"),
                Question(question: "Ay, Dünya'nın uydusu olarak bilinir.", answer: "Doğru"),
                Question(question: "Suyun kaynama noktası 100 santigrat derecedir.", answer: "Doğru"),
                Question(question: "Havanın yoğunluğu 1,225 gram/metreküptür.", answer: "Doğru"),
                Question(question: "Dünya, Güneş'in etrafında döner.", answer: "Doğru"),
                Question(question: "Ay, kendi etrafında döner.", answer: "Doğru"),
                Question(question: "Dünya, kendi etrafında dönerken aynı zamanda Güneş'in etrafında da döner.", answer: "Doğru"),
                Question(question: "Ay, Dünya'nın etrafında dönerken aynı zamanda kendi etrafında da döner.", answer: "Doğru"),
                Question(question: "Dünya, Güneş'in etrafında dönerken Ay'ın etrafında da döner.", answer: "Yanlış"),
]
    
    
    
    var questionNumber = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
      
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        if (quiz.count - 1) > questionNumber {
            questionNumber += 1
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2
                             , target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
   @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].question
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

