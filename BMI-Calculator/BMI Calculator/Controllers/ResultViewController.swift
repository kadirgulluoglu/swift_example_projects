import UIKit

class ResultViewController: UIViewController {
    
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    
    @IBAction func reCalculate(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
