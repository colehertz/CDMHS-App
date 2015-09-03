//
//  FirstViewController.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// tableview that loads any resources
    @IBOutlet var resourcesTable: UITableView!
    
    /// Array of resource objects for each cell
    var resources = [Resource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourcesTable.delegate = self
        resourcesTable.dataSource = self
        
        var grades = Resource()
        grades.title = "My Grades"
        grades.url = NSURL(string:"https://cdm.schoolloop.com/portal/login?d=x&return_url=1441319901658")
        resources.append(grades)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        Styler.styleTopBar(self, title:"HOME", backHidden: true)
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // instantiate the cell and set properties
        var cell = tableView.dequeueReusableCellWithIdentifier("resourceCell") as! ResourceCell
        cell.titleLabel.text = self.resources[indexPath.row].title
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selected = resources[indexPath.row]
    }


}

