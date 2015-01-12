//
//  ConversationViewController.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-10.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

var otherName = ""
var otherProfileName = ""

class ConversationViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var resultsScrollView: UIScrollView!
    @IBOutlet weak var frameMessageView: UIView!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    var scrollViewOriginalY:CGFloat = 0
    var frameMessageOriginalY: CGFloat = 0
    
    let mLabel = UILabel(frame: CGRectMake(5, 8, 200, 20))
    
    var messageX: CGFloat = 37.0
    var messageY: CGFloat = 26.0
    
    var messageArray = [String]()
    var senderArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        resultsScrollView.frame = CGRectMake(0, 64, theWidth, theHeight - 114)
        resultsScrollView.layer.zPosition = 20
        frameMessageView.frame = CGRectMake(0, resultsScrollView.frame.maxY, theWidth, 50)
        lineLabel.frame = CGRectMake(0, 0, theWidth, 1)
        messageTextView.frame = CGRectMake(2, 1, self.frameMessageView.frame.size.width - 50, 48)
        sendButton.center = CGPointMake(frameMessageView.frame.size.width - 30, 24)
        
        scrollViewOriginalY = self.resultsScrollView.frame.origin.y
        frameMessageOriginalY = self.frameMessageView.frame.origin.y
        
        self.title = otherProfileName
        
        mLabel.text = "Type a message..."
        mLabel.backgroundColor = UIColor.clearColor()
        mLabel.textColor = UIColor.lightGrayColor()
        messageTextView.addSubview(mLabel)
        
        refreshResults()
    }
    
    func refreshResults() {
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        messageX = 37.0
        messageY = 26.0
        
        messageArray.removeAll(keepCapacity: false)
        senderArray.removeAll(keepCapacity: false)
        
        let innerP1 = NSPredicate(format: "sender = %@ AND other = %@", userName, otherName)
        var innerQ1: PFQuery = PFQuery(className: "Messages", predicate: innerP1)
        
        let innerP2 = NSPredicate(format: "sender = %@ AND other = %@", otherName, userName)
        var innerQ2: PFQuery = PFQuery(className: "Messages", predicate: innerP2)
        
        var query = PFQuery.orQueryWithSubqueries([innerQ1, innerQ2])
        query.addAscendingOrder("createdAt")
        query.findObjectsInBackgroundWithBlock {
            
            (objects:[AnyObject]!, error: NSError!) -> Void in
            
            if error == nil {
                for object in objects {
                    
                    self.senderArray.append(object.objectForKey("sender") as String)
                    self.messageArray.append(object.objectForKey("message") as String)
                    
                }
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
