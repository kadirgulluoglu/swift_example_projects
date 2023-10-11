import Foundation


struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=c6cac07656dbba7f780821f7ad7e87df&units=metric"
    
    
    func fetchWeather(cityName:String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    
    func performRequest (urlString : String){
        if let url = URL(string:  urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJson(weatherData: safeData)
                }
                
            }
            
            task.resume()
        }
    }
    
    
    
    func parseJson(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.name)
        }
        catch {
            print(error)
        }
    }
    
}
