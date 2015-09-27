//
//  NewsVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/26/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class EventsVC: UITableViewController {
    // array of all announcements to display
    var events = [Event]()
    var noneLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        noneLabel.frame = CGRectMake(self.view.frame.width/2 - 100, self.view.frame.height/2 - 10, 200, 20)
        noneLabel.textAlignment = .Center
        noneLabel.font = UIFont(name:Styler.fontName, size:22)
        noneLabel.text = "No News"
        self.view.addSubview(noneLabel)
        noneLabel.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if events.count < 1 {
            noneLabel.hidden = false
        } else {
            noneLabel.hidden = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        Styler.styleTopBar(self, title: "EVENTS", backHidden: true)
        
        EventService.getEvents(
            { (events) -> Void in
                self.events = events
                self.tableView.reloadData()
                self.showTable()
            }, errorFunc: {(error, response) -> Void in
        })
    }
    
    func showTable() {
        self.tableView.hidden = false
        self.noneLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as! EventCell
        cell.setupCell(events[indexPath.row])
        
        return cell
    }
}