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
    //TODO: fix details information string interpolation below
    var dailyWeatherRef: DailyDatum?
    var currentDaily: Daily?
    var photo: SavePhoto?
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
        detailedView.currentWeatherLabel.text = dailyWeatherRef?.temperatureHigh.description
        //TODO: why doesnt this wotk!
        detailedView.summaryDetailLabel.text = currentDaily?.summary
        detailedView.highTempLabel.text = dailyWeatherRef?.temperatureHigh.description
        detailedView.lowTempLabel.text = dailyWeatherRef?.temperatureLow.description
        detailedView.sunriseLabel.text = dailyWeatherRef?.sunriseTime.description
        detailedView.sunsetLabel.text = dailyWeatherRef?.sunsetTime.description
        detailedView.windSpeedLabel.text = dailyWeatherRef?.windSpeed.description
        detailedView.precipitationLabel.text = dailyWeatherRef?.precipProbability.description
        //We needed 2 functions in order to largeImageURL to a string and then display it back to an image and then call it in this VC
        PixaBayAPIClient.getPixImage(urlStr: PixaBayAPIClient.getSearchResultsURLStr(from: placeNameRef)) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print("HELLLOOOOOOO \(appError)")
                case .success(let data):
                    self?.arrayOfHits = data
            }
        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
               // this creates a barButton Item to save
             navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(saveImageButtonPressed(_:)))
        updateUI()
    }
    
    
    
    
    
    
    //TODO: Fix this is the function to save the photo
        @objc func saveImageButtonPressed(_ sender: UIBarButtonItem) {
            guard let savedData = photo else { return }
              do{
                try dataPersistence.save(item: savedData)
               let alert = UIAlertController(title: "", message: "Image saved!", preferredStyle: .alert)
               let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                let save = UIAlertAction(title: "OK", style: .default, handler: nil)
               alert.addAction(cancel)
                alert.addAction(save)
               self.present(alert, animated: true)
               let newVC = FavoritesViewController()
               UIView.transition(with: view, duration: 1.0, options: [ .transitionCrossDissolve], animations: {
                   self.present(newVC, animated: true, completion: nil)
               }, completion: nil)
           } catch {
               print("error")
           }
    
    }
    
}
