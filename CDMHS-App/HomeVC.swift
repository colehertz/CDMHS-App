//
//  FirstViewController.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    
    
    /// Array of resource objects for each cell
    var resources = [Resource]()
    var selectedResource = Resource()
    var headerImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImg.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.25)
        headerImg.image = UIImage(named: "trident.png")
        headerImg.contentMode = UIViewContentMode.ScaleAspectFit
        self.tableView.tableHeaderView = headerImg
        
        var bellSchedule = Resource()
        bellSchedule.title = "Bell Schedule"
        bellSchedule.url = NSURL(string:"http://cdm.schoolloop.com/file/1385192323175/5949715866280787096.pdf")
        resources.append(bellSchedule)
        
        var handbook = Resource()
        handbook.title = "Handbook"
        handbook.url = NSURL(string:"http://ampelement.com/cdm/handbook/")
        resources.append(handbook)
        
        var calendar = Resource()
        calendar.title = "NMUSD Calendar"
        calendar.url = NSURL(string: "http://cdm.schoolloop.com/file/1385192323175/1313571048212509123.pdf")
        resources.append(calendar)
        
        var webStore = Resource()
        webStore.title = "Webstore"
        webStore.url = NSURL(string:"http://webstores.activenetwork.com/school-software/corona_del_mar_higu3/index.php#.Uex2ZxZNDZQ")
        resources.append(webStore)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        Styler.styleTopBar(self, title:"HOME", backHidden: true)
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // instantiate the cell and set properties
        var cell = tableView.dequeueReusableCellWithIdentifier("resourceCell") as! ResourceCell
        cell.titleLabel.text = self.resources[indexPath.row].title
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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

