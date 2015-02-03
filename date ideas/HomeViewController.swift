//
//  FirstViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/30/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {
    var theDates = datewrapper()
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self

        var amusementpark = dateModel(name: "Disneyland", location: "someAddress", category: "Active/Adventure", price: 0, desc: "", hours: "", phone: "", rating: 3, photo: UIImage(named: "Amusement Park"), date: nil)
        amusementpark.photo2 = UIImage(named:"buttons2")
        
        theDates.addDate(amusementpark)
        
        var mcDonalds = dateModel(name: "McDonalds", location: "someAddress",category: "Food & Drink", price: 0, desc: "", hours: "", phone: "", rating: 599, photo: UIImage(named: "mcdongers"), date: nil)
        mcDonalds.photo2 = UIImage(named:"buttons")
        theDates.addDate(mcDonalds)
        
        var netflix = dateModel(name: "Netflix", location: "someAddress",category: "At Home", price: 0, desc: "", hours: "", phone: "", rating: 90, photo: UIImage(named: "netflix"), date: nil)
        netflix.photo2 = UIImage(named: "buttons3")
        theDates.addDate(netflix)
        
        var farmers = dateModel(name: "Farmers Market", location: "someAddress", category: "Arts/Culture", price: 0, desc: "", hours: "", phone: "", rating: 889, photo: UIImage(named: "farmers"), date: nil)
        farmers.photo2 = UIImage(named:"buttons4")
        
        theDates.addDate(farmers)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if(viewController == tabBarController.viewControllers![1] as UIViewController) {
            var viewer =  tabBarController.viewControllers![1] as UINavigationController
            if viewer.topViewController is SecondViewController {
                var top = viewer.topViewController as SecondViewController
                top.theDates = self.theDates
            }
        }
        else if(viewController == tabBarController.viewControllers![3] as UIViewController)
        {
                println("favorites")
               var viewer = tabBarController.viewControllers![3] as UINavigationController
            if viewer.topViewController is FavoriteViewController {
                var favorites = viewer.topViewController as FavoriteViewController
                favorites.favorites = self.theDates
            }
            
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        println("REFRESHED PAGE")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theDates.count();
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("dateSegue", sender: self)
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath:indexPath) as dateCell
        let date = theDates.dates[indexPath.row]
        cell.dateName!.text = date.name;
        cell.voteCount.text = String(date.rating)
        cell.dateImage.image = date.photo;
        if(date.price == 0 ) {
            cell.dollarImage.image = date.photo2
        }
        return cell;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "dateSegue") {
            let destination = segue.destinationViewController as dateInfoViewController
            let path = self.tableView.indexPathForSelectedRow()
            destination.date = theDates.dates[path!.row]
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue)  {
        if(segue.identifier == "doneSegue") {
            var sourceView: SubmissionViewController = segue.sourceViewController as SubmissionViewController
            if let newItem = sourceView.input {
                println("EXISTS")
                theDates.dates += [newItem]
                let indexPath = NSIndexPath(forRow: theDates.count()-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic )
                self.tableView.reloadData()
                
            }
            //dates.append(sourceView.input!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

