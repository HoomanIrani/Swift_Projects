import Foundation

struct HourlyData: Identifiable{
    var id = UUID()
    let image: String
    let tempreture: String
    let time: String
    
    static let mockData = [
        HourlyData(image: "cloud.drizzle.fill", tempreture: "64°", time: "Now"),
        HourlyData(image: "cloud.drizzle.fill", tempreture: "54°", time: "9AM"),
        HourlyData(image: "sun.haze.circle", tempreture: "57°", time: "10AM"),
        HourlyData(image: "sun.max.fill", tempreture: "60°", time: "11AM"),
        HourlyData(image: "sun.max.fill", tempreture: "61°", time: "12AM"),
        HourlyData(image: "sun.max.fill", tempreture: "62°", time: "1PM"),
        HourlyData(image: "cloud.sun.fill", tempreture: "64°", time: "2PM"),
        HourlyData(image: "sun.dust.fill", tempreture: "69°", time: "3PM"),
        HourlyData(image: "sun.max.fill", tempreture: "70°", time: "4PM"),
        HourlyData(image: "moon.fill", tempreture: "59°", time: "5PM")
    ]
}


struct DayData: Identifiable{
    
    var id = UUID()
    let day: String
    let image: String
    let highTemp: String
    let lowTemp: String
    
    static let mockData = [
        DayData(day: "Today", image: "sun.max.fill", highTemp: "H:43°", lowTemp: "L:36°"),
        DayData(day: "Tuesday", image: "sun.max.fill", highTemp: "H:49°", lowTemp: "L:38°"),
        DayData(day: "Wednsday", image: "cloud.sun.fill", highTemp: "H:47°", lowTemp: "L:37°"),
        DayData(day: "Thursday", image: "sun.max.fill", highTemp: "H:54°", lowTemp: "L:43°"),
        DayData(day: "Friday", image: "cloud.sun.rain", highTemp: "H:57°", lowTemp: "L:39°"),
        DayData(day: "Saturday", image: "sun.haze.fill", highTemp: "H:47°", lowTemp: "L:43°"),
        DayData(day: "Sunday", image: "sun.max.fill", highTemp: "H:52°", lowTemp: "L:39°"),
        DayData(day: "Monday", image: "cloud.sun.bolt", highTemp: "H:51°", lowTemp: "L:44°"),
    ]
}


struct GridData: Identifiable{
    
    var id = UUID()
    let symbol: String
    let name: String
    let des: String
    
    static let mockData = [
        GridData(symbol: "sun.min.fill", name: "UV INDEX", des: "6 High"),
        GridData(symbol: "sunset.fill", name: "SUNSET" , des: "7:31 PM"),
        GridData(symbol: "wind", name: "WIND", des: "8 mph"),
        GridData(symbol: "drop.fill", name: "PRECIPITATION", des: "0 in last 24 hrs"),
        GridData(symbol: "thermometer.medium", name: "FEELS LIKE", des: "71°"),
        GridData(symbol: "humidity", name: "HUMIDITY", des: "45%"),
        GridData(symbol: "eye.fill", name: "VISIBILITY", des: "10 mi"),
        GridData(symbol: "tornado.circle.fill", name: "PRESSURE", des: "29.95 inHg")
    ]
}
