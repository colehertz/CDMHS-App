//
//  NewsVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/26/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class NewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // array of all announcements to display
    var announcements = [Announcement]()
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
        if announcements.count < 1 {
            newsTable.hidden = true
            noneLabel.hidden = false
        } else {
            newsTable.hidden = false
            noneLabel.hidden = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        Styler.styleTopBar(self, title: "NEWS", backHidden: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("announcementCell") as! AnnouncementCell
        cell.setObject(announcements[indexPath.row])
        
        return cell
    }
}