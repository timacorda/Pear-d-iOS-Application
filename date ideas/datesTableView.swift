//
//  datesTableView.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/31/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class datesTableView: UITableView {
    var dates = [dateModel]()
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        let cell = self.dequeueReusableCellWithIdentifier("dateCell", forIndexPath:indexPath) as dateCell
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
    
     override func numberOfRowsInSection(section: Int) -> Int {
        return dates.count;
    }
}
