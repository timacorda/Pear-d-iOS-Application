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
    var rating: Int
    var category: String
    var photo: UIImage?
    var price: Int
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
        self.rating = 0;
        self.price = 0;
    }
    
}
