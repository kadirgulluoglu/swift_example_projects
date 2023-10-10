import UIKit

struct CalculateBrain {
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    func getTip() -> Double {
        return tip
    }
    
    
    mutating func calculateTip(sender:String) {
        let buttonTitle = sender
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        print(buttonTitleMinusPercentSign)
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    mutating func calculateBill (bill:String) {
        billTotal = Double(bill)!
        let result = billTotal * (1 + tip) / Double(numberOfPeople)
        finalResult = String(format: "%.2f", result)
    }
    
    func fillSegue (segue: UIStoryboardSegue) -> ResultsViewController {
        
        let destinationVc = segue.destination as! ResultsViewController
        destinationVc.result = finalResult
        destinationVc.tip = Int(tip*100)
        destinationVc.split = numberOfPeople
        
        return destinationVc
        
    }
    
}
