//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var currentTemperatureLabel: UILabel!
  @IBOutlet weak var currentHumidityLabel: UILabel!
  @IBOutlet weak var currentPrecipitationLabel: UILabel!
  @IBOutlet weak var currentWeatherIcon: UIImageView!
  @IBOutlet weak var currentSummaryLabel: UILabel!
  @IBOutlet weak var refreshButton: UIButton!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  let client = DarkSkyAPIClient()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let coordinate = Coordinate(latitude: 40.4688, longitude: -79.9678)
    
    client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
      print(currentWeather)
      print(error)
      
      if let currentWeather = currentWeather {
        let viewModel = CurrentWeatherViewModel(model: currentWeather)
        self.displayWeather(using: viewModel)
      }
    }
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }
  
  func displayWeather(using viewModel: CurrentWeatherViewModel) {
    currentTemperatureLabel.text = viewModel.temperature
    currentHumidityLabel.text = viewModel.humidity
    currentPrecipitationLabel.text = viewModel.precipitationProbability
    currentSummaryLabel.text = viewModel.summary
    currentWeatherIcon.image = viewModel.icon
  }
}













