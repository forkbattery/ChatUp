//
//  UsersViewController.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-06.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

var userName = ""

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var resultsTable: UITableView!
    
    var resultsUsernameArray = [String]()
    var resultsProfileNameArray = [String]()
    var resultsImageFiles = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        resultsTable.frame = CGRectMake(0, 0, theWidth, theHeight - 64) //64 is the height of the navigation controller
        
        userName = PFUser.currentUser().username
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let predicate = NSPredicate(format: "username != '"+userName+"'")
        var query = PFQuery(className: "_User", predicate: predicate)
        var objects = query.findObjects()
        
        for object in objects {
            
            self.resultsUsernameArray.append(object.username)
            self.resultsProfileNameArray.append(object["profileName"] as String)
            self.resultsImageFiles.append(object["photo"] as PFFile)
            
            self.resultsTable.reloadData()
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsUsernameArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : ResultsCell = tableView.dequeueReusableCellWithIdentifier("Cell") as ResultsCell
        
        cell.usernameLabel.text = self.resultsUsernameArray[indexPath.row]
        cell.profileNameLabel.text = self.resultsProfileNameArray[indexPath.row]
        resultsImageFiles[indexPath.row].getDataInBackgroundWithBlock {
            
            (imageData:NSData!, error:NSError!) -> Void in
            
            if error == nil {
                
                let image = UIImage(data: imageData)
                cell.profileImage.image = image
                
            } 
            
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell = tableView.cellForRowAtIndexPath(indexPath) as ResultsCell
        otherName = cell.usernameLabel.text!
        otherProfileName = cell.profileNameLabel.text!
        self.performSegueWithIdentifier("goToConversationViewController", sender: self)
        
    }
    
    @IBAction func logoutButton_click(sender: AnyObject) {
        
        //logout of parse
        PFUser.logOut()
        //return to main VC
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
