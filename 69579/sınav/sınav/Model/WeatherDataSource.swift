//
//  WeatherDataSource.swift
//  sınav
//
//  Created by Lutfu on 21.01.2023.
//

//
//  WeatherDataSource.swift
//  ApplicationOne
//
//  Created by Lutfu on 21.01.2023.
//


import Foundation

class WeatherDataSource {
    
    
    
    private let baseURL = "https://api.luchtmeetnet.nl/open_api/stations"
    
    
    private var WeatherArray: Weather = Weather(data: [WeatherData(number: " ", location: " ")])
    var delegate : WeatherDataDelegate?
    
    func getListOfWeather() {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){ data, response, error in
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self) //see what it returns, if error occured.
                    let decoder = JSONDecoder()
                    print(str)
                    
                    self.WeatherArray = try! decoder.decode(Weather.self, from: data)
                    print("done")
                    
                    
                    
                    
                    
                    
                    
                }
                DispatchQueue.main.async {
                    self.delegate?.weatherListLoaded()
                }
            }
            
            dataTask.resume()
        }
    }
  
        
        func getNumberOfWeather() -> Int {
            return WeatherArray.data.count
        }
        
        func getWeather(for index:Int) ->WeatherData{
            let arr = self.WeatherArray.data
            return arr[index]
        }
        
        
        
        
        
        
        
        
        //create the URL
        
        
        
    }
    

