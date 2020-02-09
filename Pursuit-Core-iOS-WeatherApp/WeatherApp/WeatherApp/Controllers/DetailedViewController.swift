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
//    var viewControllerRef: Weather?
    var dailyWeatherRef: DailyDatum?
    var placeNameRef = ""
    var detailedView = DetailedView()
    public var dataPersistence: DataPersistence<Image>!
    
    override func loadView() {
        view = detailedView
    }
    
    private func updateUI() {
          guard let details = dailyWeatherRef else {
              fatalError("did not load an article")
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
