//
//  loginVC.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 7/25/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit
import Parse

class login: UIViewController,
             UITextFieldDelegate,
             UIAlertViewDelegate {
    
    /* Views */
    
    @IBOutlet weak var emailLoginField: UITextField!
    @IBOutlet weak var PasswordLoginField: UITextField!
    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated
    }
    
    
    /*
    // MARK: - Navigation
    //
    // In a storyboard-based app, you will often want to do a little preparation before navigation
    // override func prepareForSuque(seque: UIStoryboardSeque, sender: AnyObject?) {
            //Get the new viw contoller using seque.destinationViewController.
            //Pass the selected object to the new view controller.
    }
    */

    //MARK: Actions

    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.emailLoginField.text
        var password = self.PasswordLoginField.text
        
        if count (username.utf16Count < 8 || password.utf16Count < 6) {
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 8 characters and Password must be greater than 6.", delegate: self, cancelButtonTitle: "OK")
           alert.show()
            
        } else {
        
            
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if ((user) != nil) {
                    
                    var alert = UIAlertView(title: "Success", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }else {
                    
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                
            })
            
        }
        
    }
    
    
    @IBAction func signUpAction(sender: AnyObject) {
        
       self.performSegueWithIdentifier("signUp", sender: self)
        
    }
 }
