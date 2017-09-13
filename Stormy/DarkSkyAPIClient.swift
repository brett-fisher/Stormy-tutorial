//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Brett Fisher on 9/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
  
  fileprivate let APIKey = "8d5096f18fc10d9448ea4911fe7500fb"
  
  lazy var baseURL: URL = {
    return URL(string: "https://api.darksky.net/forecast/\(self.APIKey)/")!
  }()
  
  let downloader = JSONDownloader()
  
  func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping (CurrentWeather?, DarkSkyError?) -> Void) {
    
    guard let url = URL(string: coordinate.description, relativeTo: baseURL) else {
      completion(nil, .invalidURL)
      return
    }
    
    let request = URLRequest(url: url)
    
    let task = downloader.jsonTask(with: request) { json, error in
      
      DispatchQueue.main.async {
        
        guard let json = json else {
          completion(nil, error)
          return
        }
        
        guard let currentWeatherJSON = json["currently"] as? [String: AnyObject],
          let currentWeather = CurrentWeather(json: currentWeatherJSON) else {
            completion(nil, .jsonParsingFailure)
            return
        }
        
        completion(currentWeather, nil)
      }
      
    }
    
    task.resume()
  }
}
