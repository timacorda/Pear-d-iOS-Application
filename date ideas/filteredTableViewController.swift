//
//  filteredTableViewController.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class filteredTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var dates = [dateModel]()
    var theDates = datewrapper()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if(viewController == tabBarController.viewControllers![1] as UIViewController) {
            var viewer =  tabBarController.viewControllers![1] as UINavigationController
            if viewer.topViewController is SecondViewController {
                var top = viewer.topViewController as SecondViewController
                top.theDates = self.theDates
            }
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
