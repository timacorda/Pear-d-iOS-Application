//
//  FirstViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/30/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {
    var dates = [dateModel]()
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        
        var amusementpark = dateModel(name: "Disneyland", category: "Active/Adventure");
        amusementpark.photo = UIImage(named: "Amusement Park")
        amusementpark.price = 0;
        dates.append(amusementpark)
        println(" WE RELOADED THE PAGE")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if( viewController == tabBarController.viewControllers![1] as UIViewController) {
            println("HELLO MOVED TO SECOND PAGE")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        println("REFRESHED PAGE")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath:indexPath) as dateCell
        let date = dates[indexPath.row]
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

