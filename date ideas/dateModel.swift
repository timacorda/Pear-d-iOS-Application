//
//  dateModel.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/30/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import Foundation
import UIKit


class dateModel: NSObject {
    var name: String
    var location: String
    var category: String
    var price: Int
    var desc: String
    var hours: String
    var phone: String
    var rating: Int
    var photo: UIImage?
    var photo2: UIImage?
    var date: NSDate?
    
    init(name: String, location: String, category: String, price: Int, desc: String, hours: String, phone: String, rating: Int, photo: UIImage?, date: NSDate?) {
        self.name = name
        self.location = location
        self.category = category
        self.price = 0;
        self.desc = desc
        self.hours = hours
        self.phone = phone
        self.rating = rating
        self.photo = photo
        self.date = date
    }
    
}
