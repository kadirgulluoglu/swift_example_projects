import Foundation

struct CoinManager {

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "E62E0060-F05B-4E4C-9314-EF663EE18424"

    let currencyArray = ["USD", "AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "ZAR"]


    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }


    func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error)
                    return
                }

                if let safeData = data {
                    if let coin = self.parseJson(safeData) {
                        delegate?.didCoinUpdate(self, coin: coin)
                    }
                }

            }

            task.resume()
        }
    }

    func parseJson(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinModel.self, from: coinData)
            let rate = decodeData.rate
            let coin = CoinModel(rate: rate)
            return coin
        }
        catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}


protocol CoinManagerDelegate {
    func didCoinUpdate(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(_ error: Error?)
}
