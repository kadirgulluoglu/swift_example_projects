
import Foundation


struct WeatherData : Decodable{
    let name: String
    let main: Main
}

struct Main : Decodable {
    let temp: Double
}

