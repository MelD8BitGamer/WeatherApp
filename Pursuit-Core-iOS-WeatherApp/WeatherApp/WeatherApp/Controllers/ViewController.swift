//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
//TODO: Change the label name to the appropriate zipcode
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var weatherForZipCodeLabel: UILabel!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    var weatherForecast: Weather? {
        didSet{
            weatherCollectionView.reloadData()
        }
    }
    //the zipcode Helper also gives a placeName and we need a place to store it, then we pass it to the next view controller
    var placeNameRef = ""
    
    private var coordinate = (lat: 0.0, long: 0.0) {
        didSet {
            APIClient.fetchData(lat: coordinate.lat, long: coordinate.long) { [weak self] (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let appError):
                        self?.showAlert(title: "Error", message: "Could load coordinates \(appError)")
                    case .success(let data):
                        self?.weatherForecast = data
                    }
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherCollectionView.dataSource = self
        zipcodeTextField.delegate = self
        weatherCollectionView.delegate = self
        getUserDefaults()
        
    }
    
    //When a user types a zipcode it passes into the zipcode var and it calls the zipcodeHelper and converts the zipcode in the coordinates.
    func loadCoordinatesByZipCode(zipCode:String) {
        ZipCodeHelper.getLatLong(fromZipCode: zipCode) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    self?.showAlert(title: "Error", message: "Cannot Generate Coordinates \(appError)")
                case .success(let data):
                    self?.coordinate = (data.lat,data.long)
                    //even though i assign placeName Ref here it get assigned everywhere else on this VC
                    self?.placeNameRef = data.placeName
                    
                }
            }
        }
    }
    //TODO: fix the weather Label
    private func getUserDefaults() {
        if let userText = UserPreference.shared.getUserSearchString() {
            ZipCodeHelper.getLatLong(fromZipCode: userText) { [weak self] (result) in
                DispatchQueue.main.async{
                switch result {
                    case .failure(let appError):
                    self?.showAlert(title: "Error", message: "Could not get saved Details \(appError)")
                    case .success(let data):
                    self?.coordinate = (data.lat, data.long)
                    self?.placeNameRef = data.placeName
                    self?.weatherForZipCodeLabel.text = "Weather for \(self?.placeNameRef ?? "")"
                    }
                }
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadCoordinatesByZipCode(zipCode: textField.text ?? "11204")
        //UserPreference.shared.store(searchString: textField.text ?? "11001")
        //this gets rid of the keyboard when done
        textField.resignFirstResponder()
        return true
    }
    
    
}
//Make sure when doing collectionViews you MUST set the collection autoresizing to NONE. Go to storyboard- highlight collection view- click on size inspector- Estimate Size = NONE
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast?.daily.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionCell", for: indexPath) as? WeatherCollectionCell else { fatalError("Could not downcast to WeatherCollectionCell")}
        if let weatherDetail = weatherForecast?.daily.data[indexPath.row] {
            
            
            cell.dateDailyWeatherLabel.text = cell.dateDailyWeatherLabel.text?.dateConversion(weatherDetail.time)
            //TODO: use the extension converter for the temp
            //fontSizeOutlet.text = "Font Size \(String(format: "%0.f", fontSize))
            cell.tempLabel.text = "HighTemp: \(weatherDetail.temperatureHigh),  Low Temp: \(weatherDetail.temperatureLow)"
            cell.weatherImage.image = UIImage(named: weatherDetail.icon)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 5 //This is the space between the items
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        
        return CGSize(width: itemWidth, height: collectionView.bounds.size.height * 0.95)
    }
    //this is a function that gives padding to the collection cell all around
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    //this segues the specific cell to the detailedVC
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailedViewController()
        guard let dailyDatumRef = weatherForecast?.daily.data else {
            print("did not work")
            return
        }
        detailVC.dailyWeatherRef = dailyDatumRef[indexPath.row]
        detailVC.placeNameRef = placeNameRef
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
