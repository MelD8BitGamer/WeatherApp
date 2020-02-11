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
        
        return "https://pixabay.com/api/?key=\(SecretKey.pixaBayAppKey)&q=\(formattedString)"
    }
    static func getPixImage(urlStr: String, completionHandler: @escaping (Result<[Hit], AppError>) -> ())  {
        guard let imageURL = URL(string: urlStr) else {
            completionHandler(.failure(.badURL(urlStr)))
            return
        }
        let request = URLRequest(url: imageURL)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                //  Since the type of data you are getting back is of JSON data you need to decode it so use jsondecoder
                //Because JSon decoder throws an error we got to catch it
                do {
                    
                    let x = try JSONDecoder().decode(FavoritedPictures.self, from: data)
                    completionHandler(.success(x.hits))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                    
                }
                
            }
        }
        
    }
    
}
