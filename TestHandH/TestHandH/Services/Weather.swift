//
//  Water.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class Weather {
    
    var weatherDescription: String
    var temp: Float
    var windSpeed: Float
    var name: String
    
    init(fromDictionary dictionary: [ String: AnyObject ]) {
        let weather = dictionary["weather"] as! [[String : AnyObject]]
        let main = dictionary["main"] as! [String : AnyObject]
        let wind = dictionary["wind"] as! [String : AnyObject]
        weatherDescription = weather[0]["description"] as! String
        temp = ((main["temp"] as? NSNumber)?.floatValue)!
        windSpeed = ((wind["speed"] as? NSNumber)?.floatValue)!
        name = dictionary["name"] as! String
    }
    
    func toString() -> String {
        return "\(name)\nТемпература: \(temp)C\nСкорость ветра: \(windSpeed)м/с\nПогода: \(weatherDescription)"
    }
}
