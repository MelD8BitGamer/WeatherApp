//
//  ImageAPIClient.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/7/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PixaBayAPIClient {
    
   static func getSearchResultsURLStr(from searchString: String) -> String {
        let formattedString = searchString.replacingOccurrences(of: " ", with: "+")
        
    return "https://pixabay.com/api/\(SecretKey.pixaBayAppKey)&q=\(formattedString)"
    }
    func getImage(urlStr: String, completionHandler: @escaping (Result<[Image], AppError>) -> ())  {
        
        guard URL(string: urlStr) != nil else {
            print(AppError.badURL)
            return
        }

}
    
}
