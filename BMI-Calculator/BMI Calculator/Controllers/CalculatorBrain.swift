import UIKit


struct CalculatorBrain {
    var bmi : BMI?
    
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
    
    mutating func calculatorBMI(height:Float ,weight:Float) {
        let bmiValue = weight / (height * height)
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Biraz kilo alsan iyi olur Kanka", color: UIColor.systemBlue)
        } else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Ovvv! muhteşem fitsin Kanka", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Huh! Ekmeği kıs Spora başla Kanka", color: UIColor.purple)
        }
    }
    
}
