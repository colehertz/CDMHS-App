//
//  SocialVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/26/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class SocialVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView:UITableView!
    var mediaOptions = [SocialMediaOption]()
    var selectedObj: SocialMediaOption!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mediaOptions.append(SocialMediaOption(name: "Instagram", logo: UIImage(named: "instagramIcon.png")!, url:NSURL(string:"https://instagram.com/cdmasb")!))
        mediaOptions.append(SocialMediaOption(name: "Twitter", logo: UIImage(named: "twitterIcon.png")!, url:NSURL(string: "https://mobile.twitter.com/CdMASB")!))
     
    }
    
    override func viewWillAppear(animated: Bool) {
        Styler.styleTopBar(self, title: "SOCIAL", backHidden: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("socialCell") as! SocialMediaOptionCell
        cell.setObject(self.mediaOptions[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedObj = self.mediaOptions[indexPath.row]
        self.performSegueWithIdentifier("socialPageSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "socialPageSegue") {
            var targetVC = segue.destinationViewController as! SocialMediaView
            targetVC.socialMediaObj  = selectedObj
            
        }
    }

}