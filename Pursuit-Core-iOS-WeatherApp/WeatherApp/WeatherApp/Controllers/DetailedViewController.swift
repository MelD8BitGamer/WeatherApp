//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    //TODO: to save a photo for with data persistence
   //TODO: Fix network error!!! From pixabay url
    var dailyWeatherRef: DailyDatum?
    var placeNameRef = ""
    var detailedView = DetailedView()
    public var dataPersistence: DataPersistence<SavePhoto>!
    var arrayOfHits = [Hit](){
    didSet {
        detailedView.cityImageView.getImage(urlString: arrayOfHits[Int.random(in: 0..<arrayOfHits.count)].largeImageURL) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
            break
            case .success(let image):
                DispatchQueue.main.async {
              self?.detailedView.cityImageView.image = image
              }
                
            }
        }
    }
    }
    override func loadView() {
        view = detailedView
    }
    
    private func updateUI() {
        guard let details = dailyWeatherRef else {
            fatalError("blah")
        }
        //We needed 2 functions in order to largeImageURL to a string and then display it back to an image and then call it in this VC
        PixaBayAPIClient.getPixImage(urlStr: PixaBayAPIClient.getSearchResultsURLStr(from: placeNameRef)) { [weak self] (result) in
           
                switch result {
                case .failure(let appError):
                    print("HELLLOOOOOOO \(appError)")
                case .success(let data):
                    self?.arrayOfHits = data
            }
        }
        
    }
    //TODO: This needs to be the place of the name
    //        detailedView.currentWeatherLabel.text = viewControllerRef?.timezone
    //        detailedView.cityImageView.getImage(with: Image.getRandomImage(images: )) { [weak self] (result) in
    //            switch result {
    //            case .failure:
    //                break
    //            case .success(let image):
    //                DispatchQueue.main.async {
    //                    self?.
    //                }
    //            }
    //        }
    //      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        this creates a barButton Item to save
        //     navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(saveImageButtonPressed(_:)))
        updateUI()
    }
    
    
    
    
    
    //TODO: Get rid of ImageHelper
    //this is the function to save the photo
    //    @objc func saveImageButtonPressed(_ sender: UIBarButtonItem) {
    ////          do{
    ////            try dataPersistence.shared.save
    //            //ImagePersistenceHelper.manager.save(newPhoto: imageToSave)
    //           let alert = UIAlertController(title: "", message: "Image saved!", preferredStyle: .alert)
    //           let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    //           alert.addAction(cancel)
    //           self.present(alert, animated: true)
    //           let newVC = FavoritesViewController()
    //           UIView.transition(with: view, duration: 1.0, options: [ .transitionCrossDissolve], animations: {
    //               self.present(newVC, animated: true, completion: nil)
    //           }, completion: nil)
    ////       }catch{
    ////           print(error)
    //       }
    
    //}
    //}
}
