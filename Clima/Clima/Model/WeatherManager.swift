import Foundation
import CoreLocation


struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=c6cac07656dbba7f780821f7ad7e87df&units=metric"

    var delegate: WeatherManagerDelegate?


    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }

    func fetcWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
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
                    if let weather = self.parseJson(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }

            }

            task.resume()
        }
    }



    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name

            let weather = WeatherModel(weatherId: id, temperature: temp, cityName: name)
            return weather
        }
        catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error?)
}
