//
//  SecondViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/30/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITabBarControllerDelegate {
    var dates = [dateModel]()
    var sortedDates = [dateModel]()
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.addTarget(self, action: "actionAdventure:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.addTarget(self, action: "foodDrink:", forControlEvents: UIControlEvents.TouchUpInside)
        button3.addTarget(self, action: "atHome:", forControlEvents: UIControlEvents.TouchUpInside)
        button4.addTarget(self, action: "artsCulture:", forControlEvents: UIControlEvents.TouchUpInside)
        println(dates[0].name)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func actionAdventure(sender: UIButton) {
        sortedDates = dates.filter({$0.category == "Active/Adventure"})
        performSegueWithIdentifier("sortSegue", sender: self)
    }
    
    func foodDrink(sender: UIButton) {
        sortedDates = dates.filter({$0.category == "Food & Drink"})
        performSegueWithIdentifier("sortSegue", sender: self)
    }
    
    func atHome(sender: UIButton) {
        sortedDates = dates.filter({$0.category == "At Home"})
        performSegueWithIdentifier("sortSegue", sender: self)
    }
    func artsCulture(sender: UIButton) {
        sortedDates = dates.filter({$0.category == "Arts/Culture"})
        performSegueWithIdentifier("sortSegue", sender: self)
    }
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "sortSegue") {
            let filteredtableview = segue.destinationViewController as filteredTableViewController
            filteredtableview.dates = self.sortedDates
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

