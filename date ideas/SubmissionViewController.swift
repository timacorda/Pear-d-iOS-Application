//
//  ViewController.swift
//  TestSegment
//
//  Created by Marek Zhang on 1/31/15.
//  Copyright (c) 2015 Marek Zhang. All rights reserved.
//

import UIKit

class SubmissionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UISegmentedControl!
 
    @IBOutlet weak var dateName: UITextField!
    @IBOutlet weak var dateLoc: UITextField!
    @IBOutlet weak var dateDesc: UITextView!
    @IBOutlet weak var dateHours: UITextField!
    @IBOutlet weak var datePhone: UITextField!
    
    var arr:NSArray = []
    var name: String = ""
    var location: String = ""
    var category: String = ""
    var price: Int = 0
    var desc: String = ""
    var hours: String = ""
    var phone: String = ""
    var input: dateModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = ["Active/Adventure", "Food & Drink", "Art/Culture", "At Home"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    /* Segment Functions */
    
    @IBAction func ChangeLabel(sender: AnyObject) {
        if picker.selectedSegmentIndex == 0 {
            price = 1
        }
        if picker.selectedSegmentIndex == 1 {
            price = 2
        }
        if picker.selectedSegmentIndex == 2 {
            price = 3
        }
        if picker.selectedSegmentIndex == 3 {
            price = 4
        }
        
    }
    
    
    /* Picker Fucntions */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(arr[row])"
    }
        
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = arr.objectAtIndex(row) as String
    }
    
    
    /* Text Field Funcitons */
    
    func getTextFields() {
        name = dateName.text
        location = dateLoc.text
        desc = dateDesc.text
        phone = datePhone.text
        hours = dateHours.text
    }
    
    
    /* Build Object on Submit */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            var thisDate: NSDate = NSDate()
            getTextFields()
            input = dateModel(name: name, location: location, category: category, price: price, desc: desc, hours: hours, phone: phone, rating: 0, photo: UIImage(named: "Sandwich"), date: thisDate)
     
        }
    }
    
    
    @IBAction func backgroundTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        return true
    }
    
    
    
}

