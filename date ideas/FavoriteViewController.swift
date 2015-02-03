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
    var favorites = datewrapper()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        //tableView.dataSource = self

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if(viewController == tabBarController.viewControllers![1] as UIViewController) {
            var viewer =  tabBarController.viewControllers![1] as UINavigationController
            if viewer.topViewController is SecondViewController {
                var top = viewer.topViewController as SecondViewController
                top.theDates = favorites
            }
        }
    }
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        println("REFRESHED PAGE")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count() - 3;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath:indexPath) as dateCell
        let date = favorites.dates[indexPath.row]
        cell.dateName!.text = date.name;
        cell.voteCount.text = String(date.rating)
        cell.dateImage.image = date.photo;
        if(date.price == 0 ) {
            cell.dollarImage.image = UIImage(named: "buttons");
        }
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
