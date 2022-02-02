import Foundation

struct Weather {
    var name: String = "Город"
    var temp: Int = 0
    var url: String = ""
    
    init?(weatherData: WeatherData) {
        self.temp = weatherData.fact.temp
        self.url = weatherData.info.url
    }
    
    init() {

    }
    
}
