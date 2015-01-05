//
//  SignUpViewController.swift
//  ChatUp
//
//  Created by Kanishka Goel on 2015-01-03.
//  Copyright (c) 2015 Kanishka Goel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

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
        
        titleLabel.center = CGPointMake(theWidth/2, 90)
        profilePicImage.center = CGPointMake(theWidth/2, 220)
//        profilePicImage.layer.cornerRadius = profilePicImage.frame.size.width/2
//        profilePicImage.clipsToBounds = true
        
        addPicButton.center = CGPointMake(theWidth/2, 320)
        
        usernameText.frame = CGRectMake(16, 350, theWidth - 32, 30)
        passwordText.frame = CGRectMake(16, 400, theWidth - 32, 30)
        profileNameText.frame = CGRectMake(16, 450, theWidth - 32, 30)
        
        signUpButton.center = CGPointMake(theWidth/2, 520)

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func addPicButton_click(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        profilePicImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
