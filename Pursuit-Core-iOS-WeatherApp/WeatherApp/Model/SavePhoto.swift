//
//  SavePhoto.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
//We need to store this extra model because we cannot store a UIImage  without convert it into data
struct SavePhoto: Codable & Equatable {
    let data: Data
    
    
}
