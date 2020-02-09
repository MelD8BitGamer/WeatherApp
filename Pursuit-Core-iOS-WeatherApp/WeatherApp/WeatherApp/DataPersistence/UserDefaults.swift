//
//  UserDefaults.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

class UserPreference {
    
    // A singleton's initializer NEEDS to be private - this ensures that
    // ONLY one instance of this class is used throughout the application.
    static let shared = UserPreference()
    // Storing or persisting the unit measurement value to UserDefaults (device or simulator as permanent storage)
          
          // UserDefaults.standard is a singleton in iOS that gives us access to saving and
          
    func getUserSearchString() -> String? {
          return UserDefaults.standard.value(forKey: userSearch) as? String
      }
      
      func store(searchString: String) {
          UserDefaults.standard.set(searchString, forKey: userSearch)
      }
      
      private let userSearch = "userSearch"
}
