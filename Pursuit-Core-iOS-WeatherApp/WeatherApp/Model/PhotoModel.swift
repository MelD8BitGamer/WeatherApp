//
//  PhotoModel.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/7/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import UIKit


struct FavoritedPictures: Codable & Equatable {
    let hits: [Hit]
}

struct Hit: Codable & Equatable {
    let largeImageURL: String?
}

struct Image: Codable & Equatable {
let url: String

static func getRandomImage(images: [Image]) -> Image? {
    if let randomImage = images.randomElement() {
        return randomImage
    }
    return nil
}
   
}
