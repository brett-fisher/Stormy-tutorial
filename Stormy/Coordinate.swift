//
//  Coordinate.swift
//  Stormy
//
//  Created by Brett Fisher on 9/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
  let latitude: Double
  let longitude: Double
}

extension Coordinate: CustomStringConvertible {
  var description: String {
    return "\(latitude),\(longitude)"
  }
}
