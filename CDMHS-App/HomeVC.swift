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
    var selectedResource = Resource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourcesTable.delegate = self
        resourcesTable.dataSource = self
        
        let bellSchedule = Resource()
        bellSchedule.title = "Bell Schedule"
        bellSchedule.url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bellSchedule", ofType:"pdf")!) 
        resources.append(bellSchedule)
        
        let handbook = Resource()
        handbook.title = "Handbook"
        handbook.url = NSURL(string:"http://ampelement.com/cdm/handbook/")
        resources.append(handbook)
        
        let calendar = Resource()
        calendar.title = "NMUSD Calendar"
        calendar.url = NSURL(string: "http://cdm.schoolloop.com/file/1385192323175/1313571048212509123.pdf")
        resources.append(calendar)

        
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
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var selected = resources[indexPath.row]
        selectedResource = selected
        self.performSegueWithIdentifier("resourceSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "resourceSegue") {
            var targetVC = segue.destinationViewController as! ResourceVC
            targetVC.resource = selectedResource
        }
    }


}

