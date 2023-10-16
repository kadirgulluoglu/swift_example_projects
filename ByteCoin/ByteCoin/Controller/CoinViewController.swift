import UIKit

class CoinViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

}


//MARK: - CoinManagerDelegate

extension CoinViewController: CoinManagerDelegate {

    func didCoinUpdate(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", coin.rate)
        }

    }
    func didFailWithError(_ error: Error?) {
        print(error ?? "")
    }
}

//MARK: - UIPickerView DataSource & Delegate

extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return coinManager.currencyArray[row]
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
        self.currencyLabel.text = currency
    }
}

