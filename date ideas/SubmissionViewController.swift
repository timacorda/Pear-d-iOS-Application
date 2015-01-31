//
//  SubmissionViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class SubmissionViewController: UIViewController {
    var date: dateModel?
    @IBOutlet var dateName: UITextField!
    @IBOutlet var categoryPicker: UIPickerView!
    
    @IBOutlet var descriptionField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            if(dateName.text.isEmpty) {
                //set fields here!!!
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
