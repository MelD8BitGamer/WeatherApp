//
//  FavoritesViewCollectionCell.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/16/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesViewCollectionCell: UICollectionViewCell {
    
    private var currentWeatherRef: DailyDatum?
    
    public lazy var tempTitle: UILabel = {
           let label = UILabel()
           label.font = UIFont.preferredFont(forTextStyle: .title2)
           label.text = "The current temp"
           label.numberOfLines = 0
           label.isUserInteractionEnabled = true
           return label
       }()
    
    public lazy var weatherImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "photo")
        iv.alpha = 0
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var dateDailyWeatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.text = "Todays date"
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        return label
    }()
    override init(frame: CGRect) {
          super.init(frame: UIScreen.main.bounds)
          commonInit()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          commonInit()
      }
    
     private func commonInit() {
        setUpTempTitleConstraint()
        setupWeatherImageViewConstraint()
        setUpDateWeatherLabelConstraint()
}
    
    private func setUpTempTitleConstraint() {
        addSubview(tempTitle)
        tempTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tempTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            tempTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tempTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
     private func setupWeatherImageViewConstraint() {
         addSubview(weatherImageView)
         weatherImageView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             weatherImageView.topAnchor.constraint(equalTo: tempTitle.bottomAnchor),
             weatherImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
             weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
         ])
     }
    
    private func setUpDateWeatherLabelConstraint() {
           addSubview(dateDailyWeatherLabel)
           dateDailyWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               dateDailyWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
               dateDailyWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               dateDailyWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           ])
       }
    
    public func configureCell(for savedWeather: DailyDatum) {
        currentWeatherRef = savedWeather //associating the cell with its article
        tempTitle.text = savedWeather.temperatureHigh.description
        dateDailyWeatherLabel.text = savedWeather.time.description
    }
}
