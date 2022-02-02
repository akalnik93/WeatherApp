import Foundation

struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
}

struct Info: Decodable {
    let url: String
}

struct Fact: Decodable {
    let temp: Int
}
