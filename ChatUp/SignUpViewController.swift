//
//  SignUpViewController.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-03.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var addPicButton: UIButton!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var profileNameText: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        //constraints
        titleLabel.center = CGPointMake(theWidth/2, 90)
        profilePicImage.center = CGPointMake(theWidth/2, 220)
        //profilePicImage.layer.cornerRadius = profilePicImage.frame.size.width/2
        //profilePicImage.clipsToBounds = true
        
        addPicButton.center = CGPointMake(theWidth/2, 320)
        
        usernameText.frame = CGRectMake(16, 350, theWidth - 32, 30)
        passwordText.frame = CGRectMake(16, 400, theWidth - 32, 30)
        profileNameText.frame = CGRectMake(16, 450, theWidth - 32, 30)
        
        signUpButton.center = CGPointMake(theWidth/2, 520)

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    //select image on sign up page
    @IBAction func addPicButton_click(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    //display image on sign up page upon selecting image using UIImagePickerController
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        profilePicImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //dismiss keyboard on pressing return key on keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
        profileNameText.resignFirstResponder()
        return true
        
    }
    
    //dismiss keyboard on touching anywhere on screen
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    //when inputting information in text fields, shift the view up to view all fields
    func textFieldDidBeginEditing(textField: UITextField) {
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        //4.7 inch screen
        if(UIScreen.mainScreen().bounds.height == 667) {
            
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                self.view.center = CGPointMake(theWidth/2, theHeight/2 - 70)
                
                }, completion: {
                    (finished:Bool) in
                    //
            })
            
        }
        
        //4 inch screen
        if(UIScreen.mainScreen().bounds.height == 568) {
            
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                self.view.center = CGPointMake(theWidth/2, theHeight/2 - 170)
                
                }, completion: {
                    (finished:Bool) in
                    //
            })
            
        }
        
    }
    
    //bring back the view to normal position when done editing
    func textFieldDidEndEditing(textField: UITextField) {
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        //4.7 inch screen
        if(UIScreen.mainScreen().bounds.height == 667) {
            
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                self.view.center = CGPointMake(theWidth/2, theHeight/2)
                
                }, completion: {
                    (finished:Bool) in
                    //
            })
            
        }
        
        //4 inch screen
        if(UIScreen.mainScreen().bounds.height == 568) {
            
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                self.view.center = CGPointMake(theWidth/2, theHeight/2)
                
                }, completion: {
                    (finished:Bool) in
                    //
            })
            
        }

        
    }

    @IBAction func signUpButton_click(sender: AnyObject) {
        
        //create new Parse user
        
        var user = PFUser()
        user.username = usernameText.text
        user.password = passwordText.text
        user.email = usernameText.text
        user["profileName"] = profileNameText.text
        
        let imageData = UIImagePNGRepresentation(self.profilePicImage.image)
        let imageFile = PFFile(name: "profilepic.png", data: imageData)
        
        user["photo"] = imageFile
        
        user.signUpInBackgroundWithBlock {
            
            (succeeded:Bool!, signUpError:NSError!) -> Void in
            
            if signUpError == nil {
                
                println("Sign up completed")
                self.performSegueWithIdentifier("goToUsersViewController2", sender: self)
                
            } else {
                
                println("Can't sign up!")
                
            }
            
        }
        
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
