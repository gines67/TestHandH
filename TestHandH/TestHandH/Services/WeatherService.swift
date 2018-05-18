//
//  WeatherService.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit
import Alamofire

class WeatherService {
    private var url: String
    
    init(withKey key: String, lat: Float, lon: Float) {
        url = "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=\(key)&lat=\(lat)&lon=\(lon)&lang=ru"
    }
    
    func getData(withSuccesHandler succesHandler: @escaping (Weather) -> Void, errorHandler: @escaping (Error) -> Void)  {
        request(url).responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.value as? [String: AnyObject] else {
                    return
                }
                let weather = Weather(fromDictionary: json)
                succesHandler(weather)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
