//
//  WeatherIcon.swift
//  Stormy
//
//  Created by Brett Fisher on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

enum WeatherIcon {
  case clearDay
  case clearNight
  case rain
  case snow
  case sleet
  case wind
  case fog
  case cloudy
  case partyCloudyDay
  case partyCloudyNight
  case `default`
  
  init(iconString: String) {
    switch iconString {
    case "clear-day": self = .clearDay
    case "clear-night": self = .clearNight
    case "rain": self = .rain
    case "snow": self = .snow
    case "sleet": self = .sleet
    case "wind": self = .wind
    case "fog": self = .fog
    case "cloudy": self = .cloudy
    case "partly-cloudy-day": self = .partyCloudyDay
    case "partly-cloudy-night": self = .partyCloudyNight
    default: self = .default
    }
  }
}

extension WeatherIcon {
  var image: UIImage {
    switch self {
    case .clearDay: return #imageLiteral(resourceName: "clear-day")
    case .clearNight: return #imageLiteral(resourceName: "clear-night")
    case .rain: return #imageLiteral(resourceName: "rain")
    case .snow: return #imageLiteral(resourceName: "snow")
    case .sleet: return #imageLiteral(resourceName: "sleet")
    case .wind: return #imageLiteral(resourceName: "wind")
    case .fog: return #imageLiteral(resourceName: "fog")
    case .cloudy: return #imageLiteral(resourceName: "cloudy")
    case .partyCloudyDay: return #imageLiteral(resourceName: "partly-cloudy-day")
    case .partyCloudyNight: return #imageLiteral(resourceName: "partly-cloudy-night")
    case .default: return #imageLiteral(resourceName: "default")
    }
  }
}
