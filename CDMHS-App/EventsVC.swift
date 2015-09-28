//
//  NewsVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/26/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class EventsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // array of all announcements to display
    var events = [Event]()
    var noneLabel = UILabel()
    
    // tableview to display news
    @IBOutlet var newsTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set tableview datasource and delegate
        newsTable.dataSource = self
        newsTable.delegate = self
        
        noneLabel.frame = CGRectMake(self.view.frame.width/2 - 100, self.view.frame.height/2 - 10, 200, 20)
        noneLabel.textAlignment = .Center
        noneLabel.font = UIFont(name:Styler.fontName, size:22)
        noneLabel.text = "No News"
        self.view.addSubview(noneLabel)
        noneLabel.hidden = true
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if events.count < 1 {
            newsTable.hidden = true
            noneLabel.hidden = false
        } else {
            newsTable.hidden = false
            noneLabel.hidden = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        Styler.styleTopBar(self, title: "EVENTS", backHidden: true)
        
        getEvents()
    }
    
    func getEvents() {
        
        let eventsSubscriber = EventService.getEvents()
        .subscribeNext { result in
                print(result)
                if let response = result.get() {
                    self.events = response.get() as! [Event]
                    self.newsTable.reloadData()
                    
                    if (self.events.count > 0 ) {
                        self.showTable()
                    }
                }
            }
    }
    
    func showTable() {
        self.newsTable.hidden = false
        self.noneLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as! EventCell
        cell.setupCell(events[indexPath.row])
        
        return cell
    }
}