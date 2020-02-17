//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    private let favoritesView = FavoritesView()
    var placeNameRef = ""
    var weatherForecast: Weather? {
          didSet{
            favoritesView.collectionView.reloadData()
          }
      }
    var savedWeather = [Weather]() {
          didSet{
            favoritesView.collectionView.reloadData()
            if savedWeather.isEmpty { //we added the empty state in the next line
                        //setup our empty view on the collectionView
                        favoritesView.collectionView.backgroundView = EmptyView(title: "Saved Articles", message: "There are no currently saved articles. Start browsing by tapping on the news icon")
                    } else {
                        //remove emptyview from collectionview backgound view, background view is just a collection set up but it sets the state ogf the collection view
                        favoritesView.collectionView.backgroundView = nil
                    }
                }
            }
          
      
    //TODO: Fix this
//    var arrayOfHits = [Hit](){
//    didSet {
//        favoritesView.weatherImageView.getImage(urlString: arrayOfHits[Int.random(in: 0..<arrayOfHits.count)].largeImageURL) { [weak self] (result) in
//
//            switch result {
//            case .failure(let appError):
//            break
//            case .success(let image):
//                DispatchQueue.main.async {
//              self?.detailedView.cityImageView.image = image
//              }
//
//            }
//        }
//    }
//    }

    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesView.collectionView.dataSource = self
        favoritesView.collectionView.delegate = self
        updateUI()
    }
    
    private func updateUI() {
    PixaBayAPIClient.getPixImage(urlStr: PixaBayAPIClient.getSearchResultsURLStr(from: placeNameRef)) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print("HELLLOOOOOOO \(appError)")
                case .success(let data):
                    //TODO: array of hits
                   // self?.arrayOfHits = data
                    self?.favoritesView.collectionView.reloadData()
            }
        }
        }
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast?.daily.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesView.collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesViewCollectionCell", for: indexPath) as? FavoritesViewCollectionCell else { fatalError("Could not downcast to FavoritesViewCollectionCell")}
        if let weatherDetail = weatherForecast?.daily.data[indexPath.row] {
            
            
            cell.dateDailyWeatherLabel.text = cell.dateDailyWeatherLabel.text?.dateConversion(weatherDetail.time)
            //TODO: use the extension converter for the temp
            //fontSizeOutlet.text = "Font Size \(String(format: "%0.f", fontSize))
            cell.tempTitle.text = "HighTemp: \(weatherDetail.temperatureHigh),  Low Temp: \(weatherDetail.temperatureLow)"
            cell.weatherImageView.image = UIImage(named: weatherDetail.icon)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
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
    //TODO: do you wan tot segue or not
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       //programatically a segue
//       let article = savedArticles[indexPath.row]
//       let detailVC = ArticleDetailViewController()
//       //TODO: using initializer as opposed to injecting individual properties(Unit5)
//       detailVC.article = article
//       detailVC.dataPersistence = dataPersistence
//       //this is the seguew
//       navigationController?.pushViewController(detailVC, animated: true)
//   }

}
