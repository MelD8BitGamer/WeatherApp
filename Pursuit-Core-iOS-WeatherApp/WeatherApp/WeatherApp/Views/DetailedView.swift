//
//  DetailedView.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailedView: UIView {
    
    //TODO: Set up constraints,
    //TODO: find out what image to put in
    //TODO: how to get the detailed info in the labels and image
    
    public lazy var currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemTeal
        label.text = "weather for city"
        return label
    }()
    
    public lazy var cityImageView: UIImageView = {
        let cityImage = UIImageView()
        cityImage.backgroundColor = .systemPink
       // cityImage.image = UIImage(named: "")//TODO: call this in the view controller with the instance
        return cityImage
    }()
    
    public lazy var summaryDetailLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .systemTeal
       // label.text =
        return label
    }()
    
    public lazy var highTempLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .systemPink
        //label.text
        return label
    }()
    
    public lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemTeal
        //label.text
        return label
    }()
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemTeal
        //label.text
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        //label.text
        return label
    }()
    
    public lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemTeal
        //label.text
        return label
    }()
    
    public lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        //label.text
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
        setUpCurrentWeatherLabel()
        setUpCityImageView()
        setUpSummaryDetail()
        setUpHighTempLabel()
        setUpLowTempLabel()
        setUpSunriseLabel()
        setUpSunsetLabel()
        setUpWindSpeedLabel()
        setUpPrecipitationLabel()
        
        
    }
    
    private func setUpCurrentWeatherLabel() {
        addSubview(currentWeatherLabel)
        currentWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentWeatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            currentWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currentWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
            
        ])
        
    }
    
    private func setUpCityImageView() {
        addSubview(cityImageView)
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: currentWeatherLabel.bottomAnchor, constant: 20),
            cityImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cityImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            cityImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
            
        ])
    }
    
    private func setUpSummaryDetail() {
        addSubview(summaryDetailLabel)
        summaryDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            summaryDetailLabel.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 40),
            summaryDetailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            summaryDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //this makes the height equal to the currentWeather Label
            summaryDetailLabel.heightAnchor.constraint(equalTo: currentWeatherLabel.heightAnchor)
        ])
    }
    
    private func setUpHighTempLabel() {
        addSubview(highTempLabel)
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        highTempLabel.topAnchor.constraint(equalTo: summaryDetailLabel.bottomAnchor, constant: 20),
               highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               highTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
               //this makes the height equal to the currentWeather Label
               highTempLabel.heightAnchor.constraint(equalTo: currentWeatherLabel.heightAnchor)
        ])
    }
    
    private func setUpLowTempLabel() {
           addSubview(lowTempLabel)
           lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
           
           
           ])
       }
    
    private func setUpSunriseLabel() {
        addSubview(sunriseLabel)
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
        ])
    }
    
    private func setUpSunsetLabel() {
        addSubview(sunsetLabel)
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
        ])
    }
    
    private func setUpWindSpeedLabel() {
        addSubview(windSpeedLabel)
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
        ])
    }
    
    private func setUpPrecipitationLabel() {
       addSubview(precipitationLabel)
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
        ])
    }
}
