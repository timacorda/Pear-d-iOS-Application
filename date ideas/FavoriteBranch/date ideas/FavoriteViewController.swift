//
//  FavoriteViewController.swift
//  date ideas
//
//  Created by Ryan Chee on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import Foundation
import UIKit
class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var favorites = [dateModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        var amusementpark = dateModel(name: "Disneyland", category: "Active/Adventure");
        amusementpark.photo = UIImage(named: "Amusement Park")
        amusementpark.price = 0;
        amusementpark.date = NSDate()
        favorites.append(amusementpark)
        var netflix = dateModel(name: "Netflix", category: "At Home");
        netflix.photo = UIImage(named: "netflix")
        netflix.price = 0;
        favorites.append(netflix)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if(viewController == tabBarController.viewControllers![1] as UIViewController) {
            var viewer =  tabBarController.viewControllers![1] as UINavigationController
            if viewer.topViewController is SecondViewController {
                var top = viewer.topViewController as SecondViewController
                top.dates = favorites
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        println("REFRESHED PAGE")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath:indexPath) as dateCell
        let date = favorites[indexPath.row]
        cell.dateName!.text = date.name;
        cell.dateCategory!.text = date.category
        cell.voteCount.text = String(date.rating)
        cell.dateImage.image = date.photo;
        if(date.price == 0 ) {
            cell.dollarImage.image = UIImage(named: "zero");
        }
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
