//
//  APIClient.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

//TODO: See what goes in results?? All I am getting is errors for everything


struct APIClient {
    
    static func fetchData(lat: Double, long: Double, completion: @escaping (Result<Weather, AppError>) -> ()) {
        let endpointURLString = "https://api.darksky.net/forecast/\(SecretKey.appKey)/\(lat),\(long)"
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
