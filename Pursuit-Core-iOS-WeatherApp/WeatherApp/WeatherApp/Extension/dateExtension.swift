//
//  dateExtension.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
//TODO: use this function to convert sunrise and sunset
//you can do an extension on string ON ANYTHING
extension String {
    //this extension will give you a conversion date to make it more readable in the realWorld
    func dateConversion(_ time: Int) -> String {
        //this line is taking the seconds into a date
        let realDate = NSDate(timeIntervalSince1970: TimeInterval(time))
        
        let dateFormatter = DateFormatter()
        //this is the NSDateFormatter that I choose look at
        dateFormatter.dateFormat = "EEEE, MMM d"
        //Gives an Error:NSDate' is not implicitly convertible to 'Date'; did you mean to use 'as' to explicitly convert? If you downcast to date. Conditional cast from 'NSDate' to 'Date' always succeeds
        //This is the only time you dont use as? or as! because it always succeed https://nsdateformatter.com/
        return dateFormatter.string(from: realDate as Date)
    }
    
    
    
}
