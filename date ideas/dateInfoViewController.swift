//
//  dateInfoViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class dateInfoViewController: UIViewController {
    var date:dateModel?
    @IBOutlet var dateCategory: UILabel!
    @IBOutlet var dateName: UILabel!
    @IBOutlet var datePhoto: UIImageView!
    @IBOutlet var dateDescription: UILabel!

   override func viewDidLoad() {
        dateName.text = date?.name;
        dateCategory.text = date?.category
        datePhoto.image = date?.photo
    }







}
