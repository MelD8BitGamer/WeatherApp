//
//  UIImageView+Extensions.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getImage(urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        guard let x = URL(string: urlString) else {
            //because it is in a completion NOT a case then we say its a network errorotherwise it is a app error
            completion(.failure(.badURL(urlString)))
            return
        }
        let request = URLRequest(url: x)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
    
    
}
