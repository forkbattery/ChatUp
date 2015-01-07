//
//  ViewController.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-03.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //For UI Constraints
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    @IBOutlet weak var signupLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theWidth    = view.frame.size.width;
        let theHeight   = view.frame.size.height;
        
        titleLabel.center       = CGPointMake(theWidth/2, 130)
        usernameText.frame      = CGRectMake(16, 200, theWidth - 32, 30)
        passwordText.frame      = CGRectMake(16, 240, theWidth - 32, 30)
        loginButton.center      = CGPointMake(theWidth/2, 330)
        noAccountLabel.center   = CGPointMake(theWidth/2, theHeight - 60)
        signupLabel.center      = CGPointMake(theWidth/2, theHeight - 30)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //login
    @IBAction func loginButtonClick(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(usernameText.text, password: passwordText.text) {
            (user:PFUser!, loginError:NSError!) -> Void in
            
            if(loginError == nil) {
                
                println("Login Successful")
                self.performSegueWithIdentifier("goToUsersViewController", sender: self)
                
            } else {
                
                println("Login failed")
                
            }
            
        }
        
    }

}

