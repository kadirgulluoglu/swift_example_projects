
import Foundation

struct QuizBrain {
    let quiz = [
        Question(question: "Dünya'nın en büyük okyanusu Pasifik Okyanusu'dur.", answer: "Doğru"),
        Question(question: "Ağaçlar fotosentez yapar.", answer: "Doğru"),
        Question(question: "Atmosferde en fazla bulunan gaz azottur.", answer: "Doğru"),
        Question(question: "Mars gezegeni Dünya'ya en yakın gezegendir.", answer: "Yanlış"),
        Question(question: "Bir yıl 365 gün sürer.", answer: "Doğru"),
        Question(question: "Fransızca İtalyanca'dan türetilmiştir.", answer: "Doğru"),
        Question(question: "Bir dik üçgenin hipotenüsü, diğer iki kenarının karesinin toplamına eşittir.", answer: "Doğru"),
        Question(question: "İlk bilgisayar ENIAC, 1940'larda geliştirildi.", answer: "Doğru"),
        Question(question: "Güneş etrafında dönen sekiz gezegen vardır.", answer: "Yanlış"),
        Question(question: "Einstein, E=mc² denklemini geliştirmiştir.", answer: "Doğru"),
        Question(question: "Mona Lisa tablosu İtalyan ressam Leonardo da Vinci tarafından yapılmıştır.", answer: "Doğru"),
        Question(question: "İngilizce'de 'apple' kelimesi armut anlamına gelir.", answer: "Yanlış"),
        Question(question: "İnsan vücudu yaklaşık olarak %70 su içer.", answer: "Doğru"),
        Question(question: "Bir yıl 366 gün sürer.", answer: "Yanlış"),
        Question(question: "Amerika Birleşik Devletleri'nin başkenti New York'tur.", answer: "Yanlış"),
        Question(question: "Dünyanın en büyük okyanusu Hint Okyanusu'dur.", answer: "Yanlış"),
        Question(question: "Bir milyon metrekare, bir kilometrekareye eşittir.", answer: "Doğru"),
        Question(question: "İstanbul, Türkiye'nin en kalabalık şehridir.", answer: "Doğru"),
        Question(question: "Japonya'nın resmi dili Çince'dir.", answer: "Yanlış"),
        Question(question: "Aydınlatma için kullanılan en eski kaynak mumdu.", answer: "Doğru"),
        Question(question: "Dünyanın en yüksek dağı Everest'tir.", answer: "Doğru"),
        Question(question: "Bir insanın normal vücut sıcaklığı 36.6 derecedir.", answer: "Doğru"),
        Question(question: "Yıldızlar aslında çok büyük gazlı gezegenlerdir.", answer: "Yanlış"),
        Question(question: "Elma suyunun pH değeri 7'dir.", answer: "Yanlış"),
        Question(question: "Dünya'nın en büyük kıtası Asya'dır.", answer: "Doğru"),
        Question(question: "Kanatlı hayvanlar omurgalı hayvanlardır.", answer: "Doğru"),
        Question(question: "Mozart, ünlü bir ressamdır.", answer: "Yanlış"),
        Question(question: "Araştırmalara göre, arılar dünyadaki bitki çeşitliliğini korumada önemli bir rol oynarlar.", answer: "Doğru"),
        Question(question: "Dünya'nın en büyük adası Grönland'dır.", answer: "Doğru"),
        Question(question: "Güneş sistemi içindeki en büyük gezegen Jüpiter'dir.", answer: "Doğru"),
    ]
    var questionNumber = 0
    var userScore = 0
    
    
    mutating func checkAnswer (_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            userScore+=1
            return true
        }
        else {
            return false
        }
        
    }
    
    
    func getQuestionText () -> String {
        return quiz[questionNumber].question
    }
    
    
    
    func getProgressBar () -> Float{
        return Float(questionNumber+1) / Float(quiz.count)
    }
    
    
    mutating func nextQuestion () {
        if (quiz.count - 1) > questionNumber {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            userScore = 0
        }
        
    }
    
    func getScore () -> Int {
        return userScore
    }
}

