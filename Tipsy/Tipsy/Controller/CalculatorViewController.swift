import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var calculateBrain = CalculateBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        calculateBrain.calculateTip(sender: sender.currentTitle!)
        
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format:"%.0f",sender.value)
        calculateBrain.numberOfPeople = Int(sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            calculateBrain.calculateBill(bill: bill)
            performSegue(withIdentifier: "goToResults", sender: self)
        }
    
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            _ = calculateBrain.fillSegue(segue: segue)
        }
    }
}

