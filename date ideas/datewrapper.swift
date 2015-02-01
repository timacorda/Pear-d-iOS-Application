//
//  datewrapper.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import Foundation
import UIKit

class datewrapper: NSObject {
    var dates = [dateModel]()

    func addDate(date: dateModel) {
        dates.append(date)
    }
    
    func count() -> Int {
        return dates.count
    }
    
}